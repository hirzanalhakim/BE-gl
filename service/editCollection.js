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

const editCollection = {
  user: (req) => {
    return new Promise((resolve, reject) => {
      const collectId = req.body.collection_id
      const userId = req.body.user_id;
      const status = 'member';
      const conn = pgp(db);
      conn.query(`INSERT INTO collection_detail(collection_id, user_id, status) VALUES($1, $2, $3) RETURNING collection_id;`, [collectId, userId, status])
        .then((res) => {
          const result = 'success';
          const data = res[0];
          resolve({ result, data })
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  resto: (req) => {
    return new Promise((resolve, reject) => {
      const collectId = req.body.collection_id
      const restoId = req.body.resto_id;
      const conn = pgp(db);
      conn.query(`INSERT INTO collection_list(collection_id, resto_id) VALUES($1, $2) RETURNING collection_id;`, [collectId, restoId])
        .then((res) => {
          const result = 'success';
          const data = res[0];
          resolve({ result, data })
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  getUser: (req) => {
    return new Promise((resolve, reject) => {
      const conn = pgp(db);
      conn.query(`SELECT C.collection_name, U.user_name, U.user_id, CD.status from collection AS C INNER JOIN collection_detail AS CD ON CD.collection_id = C.collection_id INNER JOIN "user" as U ON U.user_id = CD.user_id WHERE C.collection_id = ${req.params.id}`)
        .then((res) => {
          // const result = 'success';
          // const data = res[0];
          console.log('resnya', res)
          resolve( res )
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  getResto: (req) => {
    return new Promise((resolve, reject) => {
      const conn = pgp(db);
      conn.query(`SELECT C.collection_name, R.resto_name  from collection AS C INNER JOIN collection_list AS CL ON CL.collection_id = C.collection_id INNER JOIN resto as R ON R.resto_id = CL.resto_id WHERE C.collection_id = ${req.params.id}`)
        .then((res) => {
          // const result = 'success';
          // const data = res[0];
          console.log('resnya', res)
          resolve( res )
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  getCollection: (req) => {
    return new Promise((resolve, reject) => {
      const conn = pgp(db);
      conn.query(`SELECT C.collection_name, CD.status from collection AS C INNER JOIN collection_detail AS CD ON CD.collection_id = C.collection_id WHERE CD.user_id = ${req.params.id}`)
        .then((res) => {
          // const result = 'success';
          // const data = res[0];
          console.log('resnya', res)
          resolve( res )
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  updateName: (req) => {
    return new Promise((resolve, reject) => {
      const conn = pgp(db);
      conn.query(`UPDATE collection SET collection_name = '${req.body.collection_name}' WHERE collection_id = ${req.body.collection_id}`)
        .then((res) => {
          const result = 'success';
          // console.log('resnya', res)
          resolve( {result} )
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  }
}

module.exports = editCollection