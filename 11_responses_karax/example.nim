import prologue
import karax/[karaxdsl, vdom]


# Karax template
# Note it's constructed using Karax DSL (domain specific language)
proc pageTemplate(ctx: Context): string =
    let vNode = buildHtml(html):
        head:
            title: text "This is a title"
        body:
            h1: text "This is H1 title"
            p: text "This is a paragraph"

    # Don't forget Doctype declaration to avoid any failing validation tests
    # like this one https://validator.w3.org/
    result = "<!DOCTYPE html>\n" & $vNode


# Handler that is called by the route below
proc handler(ctx: Context) {.async.} =
  resp htmlResponse(pageTemplate(ctx))


# Create new (default) settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/", handler)

# Run instance
app.run()