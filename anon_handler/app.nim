import prologue


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
# one line statement
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Hello World")

# one line statement with extra argument
app.addRoute("/", (proc(ctx: Context) {.async.} = resp "Hello World"), HttpPost)

# multiline statements 
app.get("/ping", proc(ctx: Context) {.async.} =
    let name = "Tom"
    resp "pong" & name
)

# multiline statements with extra arguments
app.addRoute("/pong", (
    proc(ctx: Context) {.async.} =
        let name = "Jerry"
        resp "ping" & name
    ),
    HttpGet,
    middlewares = @[]
)

# Run instance
app.run()
