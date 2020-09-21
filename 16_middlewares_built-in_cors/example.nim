import prologue
import prologue/middlewares/cors


# Handler that renders the form
# Note that we call for rendering a unique CSRF token for the form
proc exampleHandler(ctx: Context) {.async.} =
    resp jsonResponse(%*"""
        {
            "some key": "some test data
        }
    """)


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach route with CORS middleware and various settings
app.addRoute("/", exampleHandler)
app.addRoute("/test-cors", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["null"], allowMethods = @["put"])])
app.addRoute("/test-cors-3", exampleHandler, middlewares = @[CorsMiddleware(allowOrigins = @["null"], allowHeaders = @["Custom-Header"])])

# Run instance
app.run()
