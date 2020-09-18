import prologue


# Handlers that are called by the routes below
proc selectByParam(ctx: Context) {.async.} =
    resp "This page accessed by URL param: " & ctx.getPathParams("param")

proc selectByDefaultParam(ctx: Context) {.async.} =
    resp "This page accessed by URL non-existing param - using default value: " & ctx.getPathParams("non_exsiting_param", "default value")

proc selectMultipleParams(ctx: Context) {.async.} =
    resp "This page accessed by multiple URL params: " & ctx.getPathParams("param_1", "default value 1") & " and " & ctx.getPathParams("param_2", "default value 2")


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach different routes
app.addRoute("/select/{param}", selectByParam)
app.addRoute("/select-wrong/{param}", selectByDefaultParam)
app.addRoute("/select-multiple/{param_1}/{param_2}", selectMultipleParams)

# Run instance
app.run()