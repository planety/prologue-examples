import prologue


# Handler that is called by the route below
proc handler(ctx: Context) {.async.} =
  ctx.setCookie("test", "ok")
  resp "Cookie has been set"


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/", handler)

# Run instance
app.run()