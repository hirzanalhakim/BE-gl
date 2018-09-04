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
          let result = {
            user_id: data[0].user_id,
            username: data[0].user_name,
            userEmail: data[0].user_email
          }
          hash = data[0].user_password;
          console.log('result user_id', result.user_id);
          console.log('hash', hash)
          if (!hash) {
            notes = `can't find this username`;
            reject({ notes });
          } else {
            bcrypt.compare(user.password, hash, function (err, res) {
              console.log('res', res);
              console.log('err', err);
              if (res) {
                // Passwords match
                resolve(result)
              } else {
                notes = 'wrong password';
                reject({ notes });
              }
            });
          }

        })
        .catch(error => {
          console.log('ERROR:', error)
          reject('gagal masuk coy')
        })
        .finally(conn.$pool.end);


    })
  }
}

module.exports = login