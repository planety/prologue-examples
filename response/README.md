# Response types

TODO: find out what is it for and how to use it
```nim
app.addRoute("/init", proc(ctx: Context) {.async.} =
    resp initResponse()
)
```
