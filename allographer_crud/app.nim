import 
    strutils, 
    json

import 
    allographer/query_builder,
    prologue

import 
    views, 
    models


# Create instance
var app = newApp()

# Init schemas
discard initSchemas()

# Create routes
# List all
app.addRoute("/", proc(ctx: Context) {.async.} =
    let rows = rdb().table("todo").getPlain()
    resp htmlResponse(listView(rows=rows))
)

# Create
app.get("/create", proc(ctx: Context) {.async.} =

    if ctx.getQueryParams("save").len != 0:
        let newTask = ctx.getQueryParams("task").strip
        
        let id = rdb()
                 .table("todo")
                 .insertID(%*{
                     "task": newTask,
                     "status": 0
                 })

        resp redirect("/create/?update_status=success&id=" & $id)
    else:
        resp htmlResponse(createView(ctx.getQueryParams("update_status"), ctx.getQueryParams("id")))
)

# Read
app.get("/read/{id}", proc(ctx: Context) {.async.} =

    let id = ctx.getPathParams("id", "")

    let row = rdb()
              .table("todo")
              .where("id", "=", $id)
              .firstPlain()

    resp htmlResponse(readView(row[1]))
)

# Update
app.get("/update/{id}", proc(ctx: Context) {.async.} =
    var id = ctx.getPathParams("id", "")

    if ctx.getQueryParams("save").len != 0:
        let
            task = ctx.getQueryParams("task").strip
            status = ctx.getQueryParams("status").strip
        
        var statusId = 0
        if status == "open":
            statusId = 1

        rdb()
        .table("todo")
        .where("id", "=", id)
        .update(%*{
            "task": task, 
            "status": statusId
        })

        resp redirect("/update/" & id & "?update_status=success")
    else:
        var row = rdb()
                 .table("todo")
                 .where("id", "=", id)
                 .firstPlain()
        echo $row
        resp htmlResponse(updateView(id.parseInt, row, ctx.getQueryParams("update_status")))
)

# Delete
app.get("/delete/{id}", proc(ctx: Context) {.async.} =

    let id = ctx.getPathParams("id")

    rdb()
    .table("todo")
    .where("id", "=", id)
    .delete()

    resp redirect("/")
)

# Run instance
app.run()
