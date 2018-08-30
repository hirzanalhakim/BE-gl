const registerUser = require('../service/register')

const register = (req, res) => {
                registerUser.post(req)
                        .then(function (msg) {
                                res.send(msg)
                        })
                        .catch(function (err) {
                                res.status(500).send(err)
                        })
        }
module.exports = register