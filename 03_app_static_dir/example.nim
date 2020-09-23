import prologue


# Handler that is called by the route below
proc handler(ctx: Context) {.async.} =
  resp "<img src='static/nyan_cat.gif'><img src='static_more/thumbs_up.gif'>"


# Create new custom settings with static dir(s)
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let settings = newSettings(
        staticDirs = ["static","static_more"],
    )

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/", handler)

# Run instance
app.run()