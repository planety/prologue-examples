import prologue


# The most basic middleware
proc echoMiddleware*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "(from middleware) Before"
        # do something before
        await switch(ctx)
        # do something after
        echo "(from middleware) After"


# The handler that is called by the route below
proc pong(ctx: Context) {.async.} =
    resp "pong"


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach route with middleware
app.addRoute("/", pong, middlewares = @[echoMiddleware()])

# Run instance
app.run()
