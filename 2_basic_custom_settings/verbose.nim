import prologue


# This is a handler that is being called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new custom settings for Prologue
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let settings = newSettings(
        address = "127.0.0.1",
        port = Port(8787),
        debug = false,
        reusePort = true,
        staticDirs = [""],
        appName = "Prologue Example"
    )

# Create Prologue instance
var app = newApp(settings = settings)

# Define a new route with handler name
app.addRoute("/ping", pong)

# Run the instance
app.run()