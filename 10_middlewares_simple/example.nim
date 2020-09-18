import prologue


# The middleware with bare minimum
proc minimalMiddleware*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "(from middleware) Before"
        # do something before
        await switch(ctx)
        # do something after
        echo "(from middleware) After"


# Create new (default) settings
let settings = newSettings()

# Create instance with middleware
# Note that we (globaly) attach middleware to our instanse
var app = newApp(settings = settings, middlewares = @[minimalMiddleware()])

# Attach a routes (with handler inlined)
app.addRoute("/", proc(ctx: Context) {.async.} = resp "Check the terminal output for middleware echoes")

# Run instance
app.run()
