import prologue


# Handler
proc hello*(ctx: Context) {.async.} =
    resp "<h1>Hello, Prologue!</h1>"

# Create default settings
let settings = newSettings(debug = false)

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/hello", hello)

# Run instance
app.run()