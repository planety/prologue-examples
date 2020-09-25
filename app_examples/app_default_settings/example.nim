import prologue


# Handler that is called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/ping", pong)

# Run instance
app.run()