import prologue


# Route handler
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/ping", pong)

# Run instance
app.run()