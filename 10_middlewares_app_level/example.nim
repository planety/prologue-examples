import prologue


# The most basic middleware
proc echoMiddleware*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "(from middleware) Before"
        # do something before
        await switch(ctx)
        # do something after
        echo "(from middleware) After"


# Create new (default) settings
let settings = newSettings()

# Create instance with middleware attached globaly
var app = newApp(settings = settings, middlewares = @[echoMiddleware()])

# Attach route with handler inlined
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Check the terminal output for middleware echoes")

# Run instance
app.run()
