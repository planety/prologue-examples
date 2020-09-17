import prologue


# There are handlers that are being called by corresponding routes below
proc simple(ctx: Context) {.async.} =
    resp "You passed a param: " & ctx.getQueryParams("param")

proc greetings(ctx: Context) {.async.} =
    resp "Hello " & ctx.getQueryParams("name", "anonymous person")

proc multipleParams(ctx: Context) {.async.} =
    resp "Value for param_1 is: " & ctx.getQueryParams("param_1") & "\nValue for param_2 is: " & ctx.getQueryParams("param_2", "undefined")


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add different routes
app.addRoute("/?some={param}", simple)
app.addRoute("/greetings?name={name}", greetings)
app.addRoute("/multiple?one={param_1}&two={param_2}", multipleParams)

# Run the instance
app.run()