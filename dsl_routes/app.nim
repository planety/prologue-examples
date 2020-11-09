import std/with
import prologue


# Routes handler
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create instance
var app = newApp()

# Create routes with DSL
# You can read more about it: https://nim-lang.github.io/Nim/with.html
with app:
    get "/", echoMethod
    post "/", echoMethod
    patch "/", echoMethod
    delete "/", echoMethod

# Run instance
app.run()