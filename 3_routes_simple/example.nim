import prologue


# There are handlers that are being called by corresponding routes below
proc index(ctx: Context) {.async.} =
    resp "This is index page"

proc nested(ctx: Context) {.async.} =
    resp "This page is really \"nested\""

proc selectByParam(ctx: Context) {.async.} =
    resp "This page accessed by URL param: " & ctx.getPathParams("param", "defaulValue")



# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add different routes
# Note that we treat routes as `GET` by default.
app.addRoute("/", index)
app.addRoute("/nested/url/o/m/g", nested)
app.addRoute("/select/{param}", selectByParam)

# Run the instance
app.run()