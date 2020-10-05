import prologue
import karax/[karaxdsl, vdom]


# Template
proc pageTemplate(ctx: Context): string =
    let vNode = buildHtml(html):
        head:
            title: text "This is a title"
        body:
            h1: text "This is H1 title"
            p: text "This is a paragraph"

    # Don't forget Doctype declaration
    result = "<!DOCTYPE html>\n" & $vNode


# Render template handler
proc handler(ctx: Context) {.async.} =
  resp htmlResponse(pageTemplate(ctx))


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create route
app.addRoute("/", handler)

# Run instance
app.run()

#[
    Note:
        Karax template DSL is similar to popular PUG template engine
]#