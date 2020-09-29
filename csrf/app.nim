import prologue
import prologue/middlewares/csrf


# Render form handler
proc renderForm(ctx: Context) {.async.} =
    resp """
        <form action="/process" method="POST">
            """ & csrfToken(ctx) & """
            Favorite color: <input type="text" name="favoriteColor">
            <button type="submit">Submit</button>
        </form>
    """

# Form action handler
proc processForm(ctx: Context) {.async.} =
    resp htmlResponse("Data is pocessed")


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/", renderForm, middlewares = @[csrfMiddleWare()])
app.addRoute("/process", processForm, HttpPost, middlewares = @[csrfMiddleWare()])

# Run instance
app.run()

#[
    Note that we need to call the CSRF Middleware for both routes:
        - for rendering form to generate cookie
        - for proccesing form to verify CSRF token
]#