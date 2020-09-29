import prologue


# Route handler
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create custom settings
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let settings = newSettings(
        address = "127.0.0.1",
        port = Port(8787),
        debug = true,
        appName = "Prologue Example"
    )

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/ping", pong)

# Run instance
app.run()