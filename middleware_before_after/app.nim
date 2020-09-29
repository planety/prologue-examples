import prologue


# Basic middleware
proc echoMiddleware*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "(from middleware) Before"
        # do something before
        await switch(ctx)
        # do something after
        echo "(from middleware) After"


# Create default settings
let settings = newSettings()

# Create instance with middleware
var app = newApp(settings = settings, middlewares = @[echoMiddleware()])

# Create route
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Check the terminal output for middleware echoes")

# Run instance
app.run()
