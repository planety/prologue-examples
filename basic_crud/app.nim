import strformat, strutils, db_sqlite 
from sqlite3 import last_insert_rowid

import prologue
import views


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
# List all
app.addRoute("/", proc(ctx: Context) {.async.} =
    let db = open("sqlite.db", "", "", "")
    let rows = db.getAllRows(sql("""SELECT * FROM todo"""))
    db.close()
    resp htmlResponse(listView(rows=rows))
)
# Create
app.get("/create", proc(ctx: Context) {.async.} =
    if ctx.getQueryParams("save").len != 0:
        let
            row = ctx.getQueryParams("task").strip
            db = open("sqlite.db", "", "", "")
        db.exec(sql"INSERT INTO todo (task,status) VALUES (?,?)", row, 1)
        let
            id = last_insert_rowid(db)
        db.close()
        resp redirect("/create/?status=success&id=" & $id)
    else:
        resp htmlResponse(createView(ctx.getQueryParams("status"), ctx.getQueryParams("id")))
)
# Read
app.get("/read/{item}", proc(ctx: Context) {.async.} =
    let
        db = open("sqlite.db", "", "", "")
        item = ctx.getPathParams("item", "")
        rows = db.getAllRows(sql"SELECT task FROM todo WHERE id LIKE ?", item)
    db.close()
    if rows.len == 0:
            resp "This item number does not exist!"
    else:
            resp htmlResponse(readView($rows[0]))
)
# Update
app.get("/update/{id}", proc(ctx: Context) {.async.} =
    if ctx.getQueryParams("save").len != 0:
        let
            edit = ctx.getQueryParams("task").strip
            status = ctx.getQueryParams("status").strip
            id = ctx.getPathParams("id", "")
        var statusId = 0
        if status == "open":
                statusId = 1
        let db= open("sqlite.db", "", "", "")
        db.exec(sql"UPDATE todo SET task = ?, status = ? WHERE id LIKE ?", edit, statusId, id)
        db.close()
        resp redirect("/update/" & id & "?status=success")
    else:
        let db = open("sqlite.db", "", "", "")
        let id = ctx.getPathParams("id", "")
        let data = db.getAllRows(sql"SELECT task FROM todo WHERE id LIKE ?", id)
        db.close()
        resp htmlResponse(updateView(id.parseInt, data[0], ctx.getQueryParams("status")))
)

app.get("/delete/{id}", proc(ctx: Context) {.async.} =
    let
        id = ctx.getPathParams("id")
        db= open("sqlite.db", "", "", "")

    echo id
    db.exec(sql"DELETE FROM todo WHERE id = ?", id)
    db.close()
    resp redirect("/")
)

# Run instance
app.run()
