import prologue


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/", proc(ctx: Context) {.async.} =
    resp "This is a response"
)

app.addRoute("/text", proc(ctx: Context) {.async.} =
    resp plainTextResponse("This is text response")
)

app.addRoute("/json", proc(ctx: Context) {.async.} =
    resp jsonResponse(%*"{\"key\":\"value\"}")
)

app.addRoute("/html", proc(ctx: Context) {.async.} =
    resp htmlResponse("<h1>This is HTML response</h1>")
)

app.addRoute("/file", proc(ctx: Context) {.async.} =
    await ctx.staticFileResponse("dummy.file", "")
)

# Run instance
app.run()