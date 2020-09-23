import prologue
import prologue/middlewares/cors


# Pong handler to check if example is running
proc pong(ctx: Context) {.async.} =
  resp "pong"

# Test handler that contains 'important' data
proc exampleHandler(ctx: Context) {.async.} =
    resp jsonResponse(%*"""
        {
            "some key": "some important data
        }
    """)


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach 'ping' route
app.addRoute("/ping", pong, middlewares = @[CorsMiddleware(allowOrigins = @["null"])])

# Attach route with CORS middleware and various settings
app.addRoute("/test-null-origin", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["null"])])
app.addRoute("/test-custom-header", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["null"], allowHeaders = @["Custom-Header"])])
app.addRoute("/test-post-method", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["null"], allowMethods = @["post"])])

# Run instance
app.run()
