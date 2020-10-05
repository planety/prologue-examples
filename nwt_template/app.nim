import asyncdispatch
import prologue
import nwt


# Create default settings and template engine
let 
    settings = newSettings()
    templates = newNwt("views/*.html")

# Create instance
var app = newApp(settings = settings)

# Route handler
proc routeHandler(ctx: Context) {.async.} =
    resp htmlResponse(templates.renderTemplate("index.html"))

# Create route
app.addRoute("/", routeHandler)

# Run instance
app.run()
