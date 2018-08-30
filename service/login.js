const initOptions = {
  // global event notification;
  error(error, e) {
    if (e.cn) {
      // A connection-related error;
      //
      // Connections are reported back with the password hashed,
      // for safe errors logging, without exposing passwords.
      console.log('CN:', e.cn);
      console.log('EVENT:', error.message || error);
    }
  }
};
const pgp = require('pg-promise')(initOptions);
const db = require('./db')
const bcrypt = require('bcrypt');

const login = {
  post: (req) => {
    return new Promise((resolve, reject) => {
      let user = {
        userName: req.body.user_name,
        password: req.body.password,
      }

      const conn = pgp(db);
      conn.query(`SELECT * FROM public.user WHERE user_name = '${user.userName}'`)
        .then((data) => {
          console.log('data', data[0].user_password);
          let result = {
            username: data[0].user_name,
            userEmail: data[0].user_email
          }
          hash = data[0].user_password;

          bcrypt.compare(user.password, hash, function (err, res) {
            if (res) {
              // Passwords match
              resolve(result)
            } else {
              // Passwords don't match
              result = 'wrong password';
              resolve({ result });
            }
          });
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);


    })
  }
}

module.exports = login