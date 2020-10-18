import prologue


proc hello(ctx: Context) {.async.} =
    resp "Hello world"


var app = newApp()
app.addRoute("/hello", hello)
app.run()