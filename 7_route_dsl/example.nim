import std/with
import prologue


# This is a handler that is being called by all routes below
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Create routes using DSL (domain specific language)
# You can read about more: https://nim-lang.github.io/Nim/with.html
with app:
    get "/", echoMethod
    post "/", echoMethod
    patch "/", echoMethod
    delete "/", echoMethod

# Run the instance
app.run()