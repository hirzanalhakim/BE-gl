const collection = require('../service/collection')

const newCollection = (req, res) => {
  collection.post(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = newCollection;