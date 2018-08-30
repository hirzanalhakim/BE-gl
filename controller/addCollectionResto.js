const editCollection = require('../service/editCollection')

const addCollectionResto = (req, res) => {
  editCollection.resto(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = addCollectionResto;