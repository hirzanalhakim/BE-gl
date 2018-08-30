const getResto = require('../service/resto')

const postSchedule = (req, res) => {
                getResto.post(req)
                        .then(function (msg) {
                                res.send(msg)
                        })
                        .catch(function (err) {
                                res.status(500).send(err)
                        })
        }
module.exports = postSchedule