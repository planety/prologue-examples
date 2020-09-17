import prologue


# There are handlers that are being called by corresponding routes below
# Note that each handler expects query parameters with specified names
# We also can omit query parameter and get it's default value
proc simple(ctx: Context) {.async.} =
    resp "You passed a param: " & ctx.getQueryParams("param")

proc greetings(ctx: Context) {.async.} =
    resp "Hello " & ctx.getQueryParams("name", "anonymous person")

proc multipleParams(ctx: Context) {.async.} =
    resp "Value for param_1 is: " & ctx.getQueryParams("param_1") & " and for param_2 is: " & ctx.getQueryParams("param_2", "undefined")


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add different routes
app.addRoute("/", simple)
# Usage example:
#    http://127.0.0.1:8080/?param=HelloWorld

app.addRoute("/greetings", greetings)
# Usage example:
#    http://127.0.0.1:8080/greetings?name=Tom
#    http://127.0.0.1:8080/greetings - omitting the parameter will print it's default value

app.addRoute("/multiple", multipleParams)
# Usage example:
#    http://127.0.0.1:8080/multiple?param_1=Hello&param_2=World
#    http://127.0.0.1:8080/multiple?param_1=Hello - omitting last parameter will print it's default value

# Run the instance
app.run()