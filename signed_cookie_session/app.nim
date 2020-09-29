import prologue
import prologue/middlewares/signedcookiesession


# Create session key and settings
let 
    secretKey = "SeCrEt!KeY"
    settings = newSettings(secretKey = secretKey)

# Create app instance with session middleware
var app = newApp(settings = settings, middlewares = @[sessionMiddleware(secretKey = secretKey.SecretKey, path = "/")])

# Create routes
# set session values
app.addRoute("/", proc(ctx: Context) {.async.} =
    ctx.session["someSessionKey"] = "1234"
    ctx.session["anotherSessionKey"] = "5678"
    resp "Sessions values has been set: " & $ctx.session
)
# clear session values
app.addRoute("/clear", proc(ctx: Context) {.async.} =
    ctx.session.clear()
    resp "Sessions values has been cleared: " & $ctx.session
)

# Run instance
app.run()