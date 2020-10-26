import std/sequtils
import prologue
import prologue/i18n

when (compiles do: import karax/karaxdsl):
  import karax/[karaxdsl, vdom]
else:
  {.error: "Please use `logue extension karax` to install!".}

proc hello*(ctx: Context) {.async.} =
  let
    languages = ctx.gScope.settings["languages"].getElems().mapIt(it.getStr())
    local = ctx.request.queryParams.getOrDefault("lang", "en")

  let page = buildHtml(html):
    head:
      link(href = "https://unpkg.com/marx-css/css/marx.min.css",
          rel = "stylesheet")
    main:
      h2: text ctx.translate("Setlanguage", local)
      form(id = "lang_form", action = "/", `method` = "get"):
        select(id = "lang", name = "lang"):
          for language in languages:
            if language == local:
              option(selected = ""): text language
            else:
              option: text language

      br()
      h2: text ctx.translate("Hello World!", local)
    footer:
      script(src = "/static/js/setlang.js")
  resp $page
