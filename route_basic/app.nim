import prologue


# Handlers
proc index(ctx: Context) {.async.} =
    resp "This is index page"

proc nested(ctx: Context) {.async.} =
    resp "This page is really \"nested\""


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes (GET by default)
app.addRoute("/", index)
app.addRoute("/nested/url/o/m/g", nested)

# Run instance
app.run()