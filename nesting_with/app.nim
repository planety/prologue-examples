import std/with
import prologue


# App instance
var app = newApp()


# Nesting
var base = newGroup(app, "/apiv2", @[])
var level1 = newGroup(app,"/level1", @[], base)
var level2 = newGroup(app, "/level2", @[], level1)


# Handlers
proc hello(ctx: Context) {.async.} =
    resp "Hello"

proc hi(ctx: Context) {.async.} =
    resp "Hi"


# Routes
with base:
    get("/hello", hello)
    get("/hi", hi)

with level1:
    get("/hello", hello)
    get("/hi", hi)


with level2:
    get("/hello", hello)
    get("/hi", hi)

app.run()

#[
    URLs for base are:
        - http://127.0.0.1:8080/apiv2/hello
        - http://127.0.0.1:8080/apiv2/hi

    URLs level 1 are:
        - http://127.0.0.1:8080/apiv2/level1/hello
        - http://127.0.0.1:8080/apiv2/level1/hi

    URLs for level 2 are:
        - http://127.0.0.1:8080/apiv2/level1/level2/hello
        - http://127.0.0.1:8080/apiv2/level1/level2/hi
]#