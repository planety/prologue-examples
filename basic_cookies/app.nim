import prologue


# Route handler
proc handler(ctx: Context) {.async.} =
  ctx.setCookie("test", "ok")
  resp "Cookie has been set"


# Create instance
var app = newApp()

# Create route
app.addRoute("/", handler)

# Run instance
app.run()