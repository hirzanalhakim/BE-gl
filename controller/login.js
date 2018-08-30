const loginUser = require('../service/login')

const login = (req, res) => {
                loginUser.post(req)
                        .then(function (msg) {
                                res.send(msg)
                        })
                        .catch(function (err) {
                                res.status(500).send(err)
                        })
        }
module.exports = login