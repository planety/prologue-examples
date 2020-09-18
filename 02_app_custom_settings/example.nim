import prologue


# The handler that is called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new custom settings
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let settings = newSettings(
        address = "127.0.0.1",
        port = Port(8787),
        debug = true,
        appName = "Prologue Example"
    )

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/ping", pong)

# Run instance
app.run()