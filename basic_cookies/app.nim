import prologue


# Route handler
proc handler(ctx: Context) {.async.} =
  ctx.setCookie("test", "ok")
  resp "Cookie has been set"


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/", handler)

# Run instance
app.run()