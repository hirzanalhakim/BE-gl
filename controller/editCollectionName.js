const editCollection = require('../service/editCollection')

const editCollectionName = (req, res) => {
  editCollection.updateName(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = editCollectionName;