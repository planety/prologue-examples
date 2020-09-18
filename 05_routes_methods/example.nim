import prologue


# The handler that is called by all routes below
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach different routes
# Note that we are calling the same handler on different routes
app.addRoute("/get", echoMethod, HttpGet)
app.addRoute("/post", echoMethod, HttpPost)
app.addRoute("/put", echoMethod, HttpPut)
app.addRoute("/patch", echoMethod, HttpPatch)
app.addRoute("/delete", echoMethod, HttpDelete)

# Call a handler on the route that accepts all methods
app.addRoute("/any", echoMethod, @[HttpGet, HttpPost, HttpPut, HttpPatch, HttpDelete])

#[ 
    Did you know that if your browser is based on Chromium, you can download
    extension to test Rest API endpoints in your localhost applications?

    Like 'RestMan':
    - Chrome: https://chrome.google.com/webstore/detail/restman/ihgpcfpkpmdcghlnaofdmjkoemnlijdi
    - Opera: https://addons.opera.com/ru/extensions/details/restman/
]#

# Run instance
app.run()