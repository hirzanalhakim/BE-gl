const editCollection = require('../service/editCollection')

const addCollectionUser = (req, res) => {
  editCollection.user(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = addCollectionUser;