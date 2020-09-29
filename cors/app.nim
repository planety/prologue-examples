import prologue
import prologue/middlewares/cors


# Pong handler to check if example is running
proc pong(ctx: Context) {.async.} =
    resp "pong"

# Test handler that contains 'important' data
proc exampleHandler(ctx: Context) {.async.} =
    ctx.response.addHeader("My-Custom-Header", "1234")
    resp jsonResponse(%*"""
        {
            "some key": "some important data
        }
    """, headers = ctx.response.headers)


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/ping", pong, middlewares = @[CorsMiddleware(allowOrigins = @["*"])])
app.addRoute("/test-origin", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["*"])])
app.addRoute("/test-expose-content-length", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["*"], exposeHeaders = @["Content-Length"])])
app.addRoute("/test-put-method", exampleHandler, HttpPut, middlewares = @[CorsMiddleware(allowOrigins = @["*"], allowMethods = @["put"])])

# Run instance
app.run()
