import 
    strformat, 
    strutils, 
    sequtils

import norm/sqlite
import prologue
import views,init


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create db from init
createTables()

# Create routes
# List all
app.addRoute("/", proc(ctx: Context) {.async.} =
    let dbConn = open("sqlite.db", "", "", "")
    let rows = dbConn.getAllRows(sql"SELECT task, status, id FROM Todo")
    resp htmlResponse(listView(rows=rows))
)

# Create
app.get("/create", proc(ctx: Context) {.async.} =
    #[
    if ctx.getQueryParams("save").len != 0:
        let
            row = ctx.getQueryParams("task").strip
            dbConn = open("sqlite.db", "", "", "")
        
        ### Stuck here
        var newRow = newTodo(row, 1)
        dbConn.insert(newRow)
        ### 

        let id = 4
        resp redirect("/create/?status=success&id=" & $id)
    else:
        resp htmlResponse(createView(ctx.getQueryParams("status"), ctx.getQueryParams("id")))
    ]#
    discard
)

# Read
app.get("/read/{id}", proc(ctx: Context) {.async.} =

    let
        dbConn = open("sqlite.db", "", "", "")
        id = ctx.getPathParams("id", "")

    var row = newTodo()
    dbConn.select(row, "Todo.id = ?", id)

    resp htmlResponse(readView(row[].task))
)
# Update
app.get("/update/{id}", proc(ctx: Context) {.async.} =
    #[
    if ctx.getQueryParams("save").len != 0:
        let
            edit = ctx.getQueryParams("task").strip
            status = ctx.getQueryParams("status").strip
            id = ctx.getPathParams("id", "")
        var statusId = 0
        if status == "open":
                statusId = 1

        let dbConn = open("sqlite.db", "", "", "")
        var row = newTodo()
        dbConn.select(row, "Todo.id = ?", id)
        row.task = edit
        row.status = statusId
        dbConn.update(row)

        resp redirect("/update/" & id & "?status=success")
    resp redirect("/")
    ]#
    discard
)

app.get("/delete/{id}", proc(ctx: Context) {.async.} =

    let
        id = ctx.getPathParams("id")
        dbConn = open("sqlite.db", "", "", "")

   
    dbConn.delete(@id)
   
    resp redirect("/")
)

# Run instance
app.run()
