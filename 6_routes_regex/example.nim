import regex
import prologue


# There are handlers that are being called by corresponding routes below
proc matchA(ctx: Context) {.async.} =
    resp "This route matches \"a\" pattern"

proc matchB(ctx: Context) {.async.} =
    resp "This route matches \"b\" pattern"

proc matchXorYorZ(ctx: Context) {.async.} =
    resp "This route matches \"x\" or \"y\" or \"z\" pattern"

proc matchAnyWord(ctx: Context) {.async.} =
    resp "This route matches any word pattern"


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add few routes to show Regex patterns
app.addRoute(re"/a", matchA)
app.addRoute(re"/b", matchB)
app.addRoute(re"/[xyz]", matchXorYorZ)
app.addRoute(re"/(\w+)", matchAnyWord)


# Run the instance
app.run()