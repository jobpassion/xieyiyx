express = require("express")
router = express.Router()
logger = require("log4js").getLogger(__filename)
config = require(ROOT + "config/config")
util = require("util")
dateutil = require("dateutil")

# GET home page. 
router.get "/", (req, res) ->
  res.render "index",
    title: "Express"

  return
router.get "/policy.html", (req, res) ->
  res.render "policy",
    title: "Express"

  return
module.exports = router
