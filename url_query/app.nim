import prologue


# Handlers
proc simple(ctx: Context) {.async.} =
    resp "You passed a param: " & ctx.getQueryParams("param")

proc greetings(ctx: Context) {.async.} =
    resp "Hello " & ctx.getQueryParams("name", "anonymous person")

proc multipleParams(ctx: Context) {.async.} =
    resp "Value for param_1 is: " & ctx.getQueryParams("param_1") & " and for param_2 is: " & ctx.getQueryParams("param_2", "undefined")


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/", simple)
app.addRoute("/greetings", greetings)
app.addRoute("/multiple", multipleParams)

# Run instance
app.run()

#[
    Note that each handler expects request parameters with the specified names.
    We can also omit the request parameter and get its default value.
    You can now access to the following routes:
        - http://127.0.0.1:8080/?param=HelloWorld
        - http://127.0.0.1:8080/greetings?name=Tom
        - http://127.0.0.1:8080/greetings - omitting the parameter will print it's default value
        - http://127.0.0.1:8080/multiple?param_1=Hello&param_2=World
        - http://127.0.0.1:8080/multiple?param_1=Hello - omitting last parameter will print it's default value
]#