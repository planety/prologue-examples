import prologue


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)


# Attach multiple routes with handler content inside
# You might find this useful if you come from the Nodejs world

# One line statement
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Hello World")

# One line statement for Post method (with extra argument)
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


# Run instance
app.run()
