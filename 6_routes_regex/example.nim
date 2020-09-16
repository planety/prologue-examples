import regex
import prologue


# There are handlers that are being called by corresponding routes below
proc handlerA(ctx: Context) {.async.} =
    resp "This page handler matches \"a\" pattern"


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add couple of routes
app.addRoute(re"a", handlerA)

# Run the instance
app.run()