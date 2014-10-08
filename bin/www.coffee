debug = require("debug")("my-application")
app = require("../app")
app.set "port", process.env.PORT or 8080
server = app.listen(app.get("port"), ->
  debug "Express server listening on port " + server.address().port
  return
)
