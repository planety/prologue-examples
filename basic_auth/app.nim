import prologue
import prologue/middlewares/auth


# Route handlers
proc verify(ctx: Context, username, password: string): bool =
    username == "admin" and password == "password"

proc home(ctx: Context) {.async.} =
    resp "You logged in."


# Create instance
var app = newApp()

# Create route
app.addRoute("/", home, middlewares = @[basicAuthMiddleware(realm = "home", verify)])

# Run instance
app.run()
