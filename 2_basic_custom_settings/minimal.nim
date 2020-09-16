import prologue


proc pong(ctx: Context) {.async.} =
  resp "pong"


let settings = newSettings(
        address = "127.0.0.1",
        port = Port(8787),
        debug = false,
        reusePort = true,
        staticDirs = [""],
        appName = "Prologue Example"
    )
var app = newApp(settings = settings)
app.addRoute("/ping", pong)
app.run()