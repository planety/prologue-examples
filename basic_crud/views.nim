import strformat

import karax / [karaxdsl, vdom]


# List all view
proc listView*(rows: seq[seq[string]]): string =
    let vnode = buildHtml(html):
        head:
            link(href="https://unpkg.com/marx-css/css/marx.min.css", rel="stylesheet")
        
        main:
            h2: text "List all items"
            table:
                thead:
                    tr:
                        th: text "ID"
                        th: text "Name"
                        th: text "Status"
                        th:    
                            a(href="create"): text "Create new"
                tbody:
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
proc createView*(status: string = "", id: string = ""): string =
    let vnode = buildHtml(html):
        head:
            link(href="https://unpkg.com/marx-css/css/marx.min.css", rel="stylesheet")
        main:
            h3: text "Create new item:"
            br()
            if status != "":
                pre: text status & " for id " & id
            form(action = "/create", `method` = "get"):
                label(`for`="task"): text "Enter task name"
                input(`type` = "text", minlength = "1", maxlength = "80", name = "task")
                br()
                input(`type` = "submit", name = "save", value = "save")
                a(href="/"): text "cancel"
    result = $vnode

# Read view
proc readView*(value: string): string =
    let vnode = buildHtml(html):
        head:
            link(href="https://unpkg.com/marx-css/css/marx.min.css", rel="stylesheet")
        main:
            h3: text fmt"Read item"
            br()
            pre: text fmt"{value}"
            br()
            a(href="/"): text "go back"
    result = $vnode

# Update view
proc updateView*(id: int, value: seq[string], status: string = ""): string =
    let vnode = buildHtml(html):
        head:
            link(href="https://unpkg.com/marx-css/css/marx.min.css", rel="stylesheet")
        main:
            h3: text fmt"Update item with ID {id}"
            br()
            if status != "":
                pre: text status
            form(action = fmt"/update/{id}", `method` = "get"):
                label(`for`="task"): text "Enter task name"
                input(`type` = "text", name = "task", value = value[0], maxlength = "80")
                
                label(`for`="status"): text "Select status"
                select(name = "status"):
                    option: text "open"
                    option: text "closed"
                br()
                input(`type` = "submit", name = "save", value = "save")
                a(href="/"): text "cancel"
    result = $vnode