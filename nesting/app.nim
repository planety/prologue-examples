import prologue


var app = newApp()

var base = newGroup(app, "/apiv2", @[])
var level1 = newGroup(app,"/level1", @[], base)
var level2 = newGroup(app, "/level2", @[], level1)


proc hello(ctx: Context) {.async.} =
    resp "Hello"

proc hi(ctx: Context) {.async.} =
    resp "Hi"

proc home(ctx: Context) {.async.} =
    resp "Home"


let
    urlpattern1 = @[pattern("/hello", hello), pattern("/hi", hi)]
    urlpattern2 = @[pattern("/home", home)]
    tab = {level1: urlpattern1, level2: urlpattern2}

app.addGroup(tab)
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