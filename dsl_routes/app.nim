import std/with
import prologue


# Routes handler
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes with DSL
# You can read more about it: https://nim-lang.github.io/Nim/with.html
with app:
    get "/", echoMethod
    post "/", echoMethod
    patch "/", echoMethod
    delete "/", echoMethod

# Run instance
app.run()