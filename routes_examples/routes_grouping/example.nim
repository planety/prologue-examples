import prologue


# Handler for / (index) route. 
proc handlerIndex(ctx: Context) {.async.} =
    resp "This is index page"

# Handler for /about route. 
proc handlerAbout(ctx: Context) {.async.} =
    resp "This is about page"


# Use Nim sequence to store child routes
const
    basicRoutes = @[
        pattern("/", handlerIndex),
        pattern("about", handlerAbout) # we don't use '/' before 'about'
    ]
    textRoutes = @[
        pattern("/articles", proc(ctx: Context) {.async.} = resp "This is articles page"),
        pattern("/post", proc(ctx: Context) {.async.} = resp "This is post page"),
    ]
    userRoutes = @[
        pattern("/login", (proc(ctx: Context) {.async.} = resp "This is login page"), @[HttpGet, HttpPost]),
        pattern("/logout", (proc(ctx: Context) {.async.} = resp "This is logout page"), @[HttpPost])
    ]


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach new route with const names that serves as group containers
app.addRoute(basicRoutes, "/")
app.addRoute(textRoutes, "/wiki")
app.addRoute(userRoutes, "/user")

# Run instance
app.run()

#[
    You can now access to the following routes:
        - http://127.0.0.1:8080/
        - http://127.0.0.1:8080/about
        - http://127.0.0.1:8080/wiki/articles
        - http://127.0.0.1:8080/wiki/post
        - http://127.0.0.1:8080/user/login (both GET and POST)
        - http://127.0.0.1:8080/user/logout (only POST)

    Also note that 'textRoutes' and 'userRoutes' use inline handlers (for sake of space saving and simplicity)
]#