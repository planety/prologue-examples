import prologue


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Our routes with inline handlers
app.addRoute("/add", proc(ctx: Context) {.async.} =
    ctx.response.addHeader("My-Custom-Header", "1234")
    resp "Open Developer Console and check for the custom header"
)

app.addRoute("/set", proc(ctx: Context) {.async.} =
    ctx.response.addHeader("My-Custom-Header", "1234")
    ctx.response.setHeader("My-Custom-Header", "5678")
    resp "Open Developer Console and check for the custom header"
)

app.addRoute("/json", proc(ctx: Context) {.async.} =
    ctx.response.addHeader("My-Custom-Header", "1234")
    resp jsonResponse(%*"""{"key":"value"}""", headers = ctx.response.headers)
)

# Run instance
app.run()