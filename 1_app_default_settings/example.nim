import prologue


# This is a handler that is being called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add a new route with handler name
app.addRoute("/ping", pong)

# Run the instance
app.run()