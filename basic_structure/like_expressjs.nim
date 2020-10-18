import prologue


var app = newApp()
app.addRoute("/hello", proc(ctx: Context) {.async.} =
    resp "Hello world")
app.run()