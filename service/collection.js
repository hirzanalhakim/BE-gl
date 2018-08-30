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
const db = require('./db');
const moment = require('moment');
const TransactionMode = pgp.txMode.TransactionMode;
const isolationLevel = pgp.txMode.isolationLevel;
const mode = new TransactionMode({
  tiLevel: isolationLevel.serializable,
  readOnly: false,
  deferrable: true
});

const collection = {
  post: (req) => {
    return new Promise((resolve, reject) => {
      const restoId = req.body.resto_id;
      const collect_name = req.body.collection_name;
      const userId = req.body.user_id;
      const status = req.body.status;
      const createTime = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');
      const conn = pgp(db);
      conn.tx({ mode }, t => {
        // do transaction queries here
        return t.one(`INSERT INTO collection(collection_name, create_time) VALUES($1, $2) RETURNING collection_id;`, [collect_name, createTime])
          .then((data) => {
            const q1 = t.one('INSERT INTO collection_detail(collection_id, user_id, status) VALUES($1, $2, $3) RETURNING collection_id', [data.collection_id, userId, status])
            const q2 = t.none('INSERT INTO collection_list(collection_id, resto_id) VALUES($1, $2)', [data.collection_id, restoId])

            return t.batch([q1, q2]);
          })

      })
        .then((res) => {
          // success;
          const result = 'success';
          console.log('data', res);
          const data = res[0];
          resolve({ result, data })
        })
        .catch(error => {
          reject(error)
        });

      pgp.end();


    })
  }
}

module.exports = collection