import prologue


proc hello(ctx: Context) {.async.} =
    resp "Hello world"

let urlPatterns* = @[
    pattern("/", hello)
]


var app = newApp()
app.addRoute(urls.urlPatterns, "")
app.run()