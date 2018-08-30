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

const register = {
  post: (req) => {
    return new Promise((resolve, reject) => {
      let user = {
        userName: req.body.user_name,
        password: req.body.password,
        userEmail: req.body.user_email,
      }
      const conn = pgp(db);
      let passwordHash;

      bcrypt.hash(user.password, 10, function (err, hash) {
        // Store hash in database
        passwordHash = hash;
        if (hash) {
          conn.query(`INSERT INTO public.user(user_name, user_password, user_email) VALUES('${user.userName}', '${passwordHash}', '${user.userEmail}')`)
            .then(() => {
              const result = 'success';
              resolve({ result })
            })
            .catch(error => {
              console.log('ERROR:', error)
              reject(error)
            })
            .finally(conn.$pool.end);
        } else {
          const error = 'register fail';
          reject({ error });
        }
      });
    })
  }
}

module.exports = register