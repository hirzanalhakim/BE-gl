const getResto = require('../service/resto')

const showResto = (req, res) => {
  getResto.get(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = showResto;