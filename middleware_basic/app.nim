import prologue


# Middlewares
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


# Routes handler
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create default settings
let settings = newSettings()

# Create instance with middleware
var app = newApp(settings = settings, middlewares = @[middlewareA()])

# Create routes with middlewares
app.addRoute("/", pong, middlewares = @[middlewareB(), middlewareC()])
app.addRoute("/only-b", pong, middlewares = @[middlewareB()])
app.addRoute("/only-c", pong, middlewares = @[middlewareC()])

# Run instance
app.run()
