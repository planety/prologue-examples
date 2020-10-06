import json
import prologue
import nwt


# Create default settings
let settings = newSettings()

# Create template engine
var templates {.threadvar.}: Nwt 
templates = newNwt("views/*.html")

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/", proc(ctx: Context) {.async, gcsafe.} =
    resp htmlResponse(templates.renderTemplate("index.html"))
)

app.addRoute("/about", proc(ctx: Context) {.async, gcsafe.} =
    resp htmlResponse(templates.renderTemplate("about.html"))
)

app.addRoute("/stats", proc(ctx: Context) {.async, gcsafe.} =
    var data = %* {
        "title": "some variables from nim", 
        "foo": "Foo!", "bar": "Bar!"
    }
    resp htmlResponse(templates.renderTemplate("stats.html", data))
)

# Run instance
app.run()