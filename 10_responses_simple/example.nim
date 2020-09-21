import prologue


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
# Note that we use 'inlined' handlers for simplicity
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

# TODO: Need to comment why syntax is different
app.addRoute("/file", proc(ctx: Context) {.async.} =
    await ctx.staticFileResponse("dummy.file", "")
)

#[ TODO: find out what is it for and how to use it
app.addRoute("/init", proc(ctx: Context) {.async.} =
    resp initResponse()
) ]#

# Run instance
app.run()