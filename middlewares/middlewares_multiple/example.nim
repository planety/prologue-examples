import prologue


# Three middlewares to play around
proc middlewareA*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "It's an 'A'"
        await switch(ctx)

proc middlewareB*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "It's a 'B'"
        await switch(ctx)

proc middlewareC*(): HandlerAsync =
    result = proc(ctx: Context) {.async.} =
        echo "It's a 'C'"
        await switch(ctx)


# The handler that is called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new (default) settings
let settings = newSettings()

# Create instance with middleware attached globaly
var app = newApp(settings = settings, middlewares = @[middlewareA()])

# Attach routes with different middlewares
app.addRoute("/", pong, middlewares = @[middlewareB(), middlewareC()])
app.addRoute("/only-b", pong, middlewares = @[middlewareB()])
app.addRoute("/only-c", pong, middlewares = @[middlewareC()])

# Run instance
app.run()
