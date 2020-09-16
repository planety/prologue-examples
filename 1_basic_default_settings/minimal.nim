import prologue


proc pong(ctx: Context) {.async.} =
  resp "pong"


let settings = newSettings()
var app = newApp(settings = settings)
app.addRoute("/ping", pong)
app.run()