const editCollection = require('../service/editCollection')

const getCollectionUser = (req, res) => {
  editCollection.getUser(req)
    .then(function (msg) {
      res.send(msg)
    })
    .catch(function (err) {
      res.status(500).send(err)
    })
}

module.exports = getCollectionUser;