debug = require("debug")("my-application")
app = require("./app")
app.set "port", process.env.OPENSHIFT_NODEJS_PORT or 8080
ipaddress = process.env.OPENSHIFT_NODEJS_IP
if (typeof ipaddress == "undefined") 
    ipaddress = "127.0.0.1"
server = app.listen(app.get("port"),ipaddress, ->
  debug "Express server listening on port " + server.address().port
  return
)
