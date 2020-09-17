import prologue

# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add a new route with a handler body inside
# You might find it useful if you came from Nodejs world

# One line statement
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Hello World")

# One line statement for Post method (extra argument)
app.addRoute("/", (proc(ctx: Context) {.async.} = resp "Hello World"), HttpPost)

# Multiline statements 
app.addRoute("/ping", (
    proc(ctx: Context) {.async.} =
        let name = "Tom"
        resp "pong" & name
    )
)

# Multiline statements with extra arguments
app.addRoute("/pong", (
    proc(ctx: Context) {.async.} =
        let name = "Jerry"
        resp "ping" & name
    ),
    HttpGet,
    middlewares = @[]
)

# Run the instance
app.run()
