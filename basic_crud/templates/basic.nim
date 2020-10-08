import strformat

import karax / [karaxdsl, vdom]

# List all view
proc listView*(rows: seq[seq[string]]): string =
    let vnode = buildHtml(html):
        h1: text "List all items"
        table(border = "1"):
            tr:
                td:
                    p: text "ID"
                td:
                    p: text "Name"
                td:    
                    a(href="create"): text "Create new"
            for row in rows:
                tr:
                    for col in row:
                        td: text col
                    td:
                        a(href="read/" & $row[0]): text "Read"
                        a(href="update/" & $row[0]): text "Update"
                        a(href="delete/" & $row[0]): text "Delete"
    result = $vnode

# Create view
proc createView*(): string =
    let vnode = buildHtml(html):
        h1: text "Create new item:"
        form(action = "/create", `method` = "get"):
            input(`type` = "text", size = "100", maxlength = "80", name = "task")
            input(`type` = "submit", name = "save", value = "save")
    result = $vnode

# Read view
proc readView*(value: string): string =
    let vnode = buildHtml(html):
        h1: text fmt"Read item"
        p: text fmt"{value}"
    result = $vnode

# Update view
proc updateView*(id: int, value: seq[string]): string =
    let vnode = buildHtml(html):
        h1: text fmt"Update item with ID {id}"
        form(action = fmt"/update/{id}", `method` = "get"):
            input(`type` = "text", name = "task", value = value[0], size = "100",
                    maxlength = "80")
            select(name = "status"):
                option: text "open"
                option: text "closed"
            br()
            input(`type` = "submit", name = "save", value = "save")
    result = $vnode

