import prologue


# Routes handler
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! Selected method is : " & $ctx.request.reqMethod


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/get", echoMethod, HttpGet)
app.addRoute("/post", echoMethod, HttpPost)
app.addRoute("/put", echoMethod, HttpPut)
app.addRoute("/patch", echoMethod, HttpPatch)
app.addRoute("/delete", echoMethod, HttpDelete)
app.addRoute("/any", echoMethod, @[HttpGet, HttpPost, HttpPut, HttpPatch, HttpDelete])

# alternative way
app.get("/alt-get", echoMethod)
app.post("/alt-post", echoMethod)
app.put("/alt-put", echoMethod)
app.patch("/alt-patch", echoMethod)
app.delete("/alt-delete", echoMethod)

# Run instance
app.run()
