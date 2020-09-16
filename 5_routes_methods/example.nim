import prologue


# This is a handler that is being called by all routes below
proc echoMethod(ctx: Context) {.async.} =
    resp "Hey! The selected method is : " & $ctx.request.reqMethod


# Create new (default) settings for Prologue
let settings = newSettings()

# Create Prologue instance
var app = newApp(settings = settings)

# Add different routes
# Note that we attach one handler to different routes
app.addRoute("/get", echoMethod, HttpGet)
app.addRoute("/post", echoMethod, HttpPost)
app.addRoute("/put", echoMethod, HttpPut)
app.addRoute("/patch", echoMethod, HttpPatch)
app.addRoute("/delete", echoMethod, HttpDelete)

# This time we add a handler to one route that accepts all methods
app.addRoute("/any", echoMethod, @[HttpGet, HttpPost, HttpPut, HttpPatch, HttpDelete])

#[ 
    Did you know that if your browser is Chromium based you can download 
    an extension to test Rest API endpoints in your localhost apps?

    Like 'RestMan':
    - Chrome: https://chrome.google.com/webstore/detail/restman/ihgpcfpkpmdcghlnaofdmjkoemnlijdi
    - Opera: https://addons.opera.com/ru/extensions/details/restman/
]#

# Run the instance
app.run()