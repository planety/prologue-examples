import prologue


# Handlers that are called by the routes below
proc index(ctx: Context) {.async.} =
    resp "This is index page"

proc nested(ctx: Context) {.async.} =
    resp "This page is really \"nested\""


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach two routes
# Note that routes are treated as GET by default.
app.addRoute("/", index)
app.addRoute("/nested/url/o/m/g", nested)

# Run instance
app.run()