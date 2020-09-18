import prologue
import prologue/middlewares/csrf


# Handler that renders the form
# Note that we call for rendering a unique CSRF token for the form
proc renderForm(ctx: Context) {.async.} =
    resp """
        <form action="/process" method="POST">
            """ & csrfToken(ctx) & """
            Favorite color: <input type="text" name="favoriteColor">
            <button type="submit">Submit</button>
        </form>
    """

# Handler that is served as an action for the form
proc processForm(ctx: Context) {.async.} =
    resp htmlResponse("Data is pocessed")


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach route with middleware
# Note that we need to call the CSRF Middleware for both routes:
#    - for rendering form to generate cookie
#    - for proccesing form to verify CSRF token
app.addRoute("/", renderForm, middlewares = @[csrfMiddleWare()])
app.addRoute("/process", processForm, HttpPost, middlewares = @[csrfMiddleWare()])

# Run instance
app.run()
