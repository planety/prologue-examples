import std/with
import prologue


# The handler that is called by the routes below
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach routes using DSL (domain specific language)
# You can read about more: https://nim-lang.github.io/Nim/with.html
with app:
    get "/", echoMethod
    post "/", echoMethod
    patch "/", echoMethod
    delete "/", echoMethod

# Run instance
app.run()