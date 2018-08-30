const editCollection = require('../service/editCollection')

const getCollection = (req, res) => {
  editCollection.getCollection(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = getCollection;