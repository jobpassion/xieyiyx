config = require "./config/config"
express = require("express")
path = require("path")
favicon = require("static-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
session = require("express-session")
bodyParser = require("body-parser")
routes = require("./routes/index")
app = express()
app.use cookieParser()
app.use session(secret: "1234567890QWERTY")

# view engine setup
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use favicon()
app.use logger("dev")
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use require("less-middleware")(src: path.join(__dirname, "public"))
app.use express.static(path.join(__dirname, "public"))
app.use "/", routes

#/ catch 404 and forwarding to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  next err
  return


#/ error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err

    return


# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}

  return

module.exports = app
