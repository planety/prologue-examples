import prologue


# There are handlers that are being called by corresponding routes below
proc index(ctx: Context) {.async.} =
    resp "This is index page"

proc nested(ctx: Context) {.async.} =
    resp "This page is really \"nested\""

proc selectByParam(ctx: Context) {.async.} =
    resp "This page accessed by URL param: " & ctx.getPathParams("param")

proc selectByDefaultParam(ctx: Context) {.async.} =
    resp "This page accessed by URL non-existing param - using default value: " & ctx.getPathParams("non_exsiting_param", "default value")

proc selectMultipleParams(ctx: Context) {.async.} =
    resp "This page accessed by multiple URL params: " & ctx.getPathParams("param_1", "default value 1") & " and " & ctx.getPathParams("param_2", "default value 2")


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add different routes
# Note that we treat routes as `GET` by default.
app.addRoute("/", index)
app.addRoute("/nested/url/o/m/g", nested)
app.addRoute("/select/{param}", selectByParam)
app.addRoute("/select-wrong/{param}", selectByDefaultParam)
app.addRoute("/select-multiple/{param_1}/{param_2}", selectMultipleParams)

# Run the instance
app.run()