import prologue


# Route handler
proc handler(ctx: Context) {.async.} =
  resp "<img src='static/nyan_cat.gif'><img src='static_more/thumbs_up.gif'>"


# Create custom settings with static dirs location
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let settings = newSettings(
        staticDirs = ["static","static_more"],
    )

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/", handler)

# Run instance
app.run()