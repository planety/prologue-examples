import prologue
from prologue/middlewares/staticfile import staticFileMiddleware

# Route handler
proc handler(ctx: Context) {.async.} =
  resp "<img src='static/nyan_cat.gif'><img src='static_more/thumbs_up.gif'>"


# Create instance
var app = newApp()

app.use(staticFileMiddleware("static","static_more"))

# Create route
app.addRoute("/", handler)

# Run instance
app.run()