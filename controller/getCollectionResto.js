const editCollection = require('../service/editCollection')

const getCollectionResto = (req, res) => {
  editCollection.getResto(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = getCollectionResto;