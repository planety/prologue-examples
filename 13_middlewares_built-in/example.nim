import prologue
import prologue/middlewares/csrf


# Handler that renders the form
proc renderForm(ctx: Context) {.async.} =
    resp htmlResponse("""
        <form action="/process" method="POST">
            """ & csrfToken(ctx) & """
            Favorite color: <input type="text" name="favoriteColor">
            <button type="submit">Submit</button>
        </form>
    """) 

# Handler that is served as an action for the form
proc processForm(ctx: Context) {.async.} =
    resp htmlResponse("""
        Data is being processed
    """)

# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach route with middleware
app.addRoute("/", renderForm, middlewares = @[csrfMiddleWare()])
app.addRoute("/process", processForm, HttpPost, middlewares = @[csrfMiddleWare()])

# Run instance
app.run()
