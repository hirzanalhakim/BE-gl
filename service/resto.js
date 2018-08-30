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
const moment = require('moment');

const getResto = {
  post: (req) => {
    return new Promise((resolve, reject) => {
      let restoDetail = {
        restoId: req.params.id,
        day: req.body.day,
        open_time: req.body.open_time,
        close_time: req.body.close_time
      }

      const conn = pgp(db);

      conn.query(`INSERT INTO resto_detail(resto_id, day, time_open, time_close) VALUES(${restoDetail.restoId}, '${restoDetail.day}', '${restoDetail.open_time}', '${restoDetail.close_time}')`)
        .then(() => {
          const result = 'success';
          resolve({ result })
        })
        .catch(error => {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
  get: (req) => {
    return new Promise((resolve, reject) => {
      const conn = pgp(db);
      const days = moment(Date.now()).format('dddd').toLowerCase();
      const clock = moment(Date.now()).format('HH:mm:ss');
      // const clock = '23:00:00';
      console.log('days', days);
      console.log('clock', clock)
      conn.query(`SELECT * from resto as R INNER JOIN resto_detail as RD ON R.resto_id = RD.resto_id WHERE RD.day = '${days}' and RD.time_open <= '${clock}' and RD.time_close >= '${clock}'`)
        .then(function (data) {
          const result = true;
          resolve({ result, data });
        })
        .catch(function (error) {
          console.log('ERROR:', error)
          reject(error)
        })
        .finally(conn.$pool.end);
    })
  },
}

module.exports = getResto