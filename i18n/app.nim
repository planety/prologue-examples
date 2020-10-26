import std/[os, strutils]

import prologue
import prologue/i18n
from prologue/middlewares/staticfile import staticFileMiddleware

import ./urls

let
  env = loadPrologueEnv(".env")
  languages = env.getOrDefault("languages", "").split(',')
  settings = newSettings(appName = env.getOrDefault("appName", "Prologue"),
                         debug = env.getOrDefault("debug", true),
                         port = Port(env.getOrDefault("port", 8080)),
                         secretKey = env.getOrDefault("secretKey", ""),
                         data = %* {"languages": languages},
    )


var app = newApp(settings = settings)
# Be careful with the routes.
app.addRoute(urls.urlPatterns, "")
app.use(staticFileMiddleware(env.get("staticDir")))
app.loadTranslate(expandFileName("translations/trans.ini"))
app.run()
