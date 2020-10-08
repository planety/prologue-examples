import prologue
import db_sqlite, strformat, strutils
from sqlite3 import last_insert_rowid

import templates/basic


proc listItems*(ctx: Context) {.async.} =
    let db = open("sqlite.db", "", "", "")
    let rows = db.getAllRows(sql("""SELECT id, task FROM todo WHERE status LIKE "1""""))
    db.close()
    resp htmlResponse(listView(rows=rows))

proc createItem*(ctx: Context) {.async.} =
    if ctx.getQueryParams("save").len != 0:
        let
            row = ctx.getQueryParams("task").strip
            db = open("sqlite.db", "", "", "")
        db.exec(sql"INSERT INTO todo (task,status) VALUES (?,?)", row, 1)
        let
            id = last_insert_rowid(db)
        db.close()
        resp htmlResponse(fmt"<p>New item was inserted into the database, the ID is {id}</p>")
    else:
        resp htmlResponse(createView())

proc readItem*(ctx: Context) {.async.} =
    let
        db = open("sqlite.db", "", "", "")
        item = ctx.getPathParams("item", "")
        rows = db.getAllRows(sql"SELECT task FROM todo WHERE id LIKE ?", item)
    db.close()
    if rows.len == 0:
            resp "This item number does not exist!"
    else:
            resp htmlResponse(readView($rows[0]))

proc updateItem*(ctx: Context) {.async.} =
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
        resp htmlResponse(fmt"<p>The item with ID {id} was successfully updated</p>")
    else:
        let db= open("sqlite.db", "", "", "")
        let id = ctx.getPathParams("id", "")
        let data = db.getAllRows(sql"SELECT task FROM todo WHERE id LIKE ?", id)
        resp htmlResponse(updateView(id.parseInt, data[0]))

proc deleteItem*(ctx: Context) {.async.} =
    let
      id = ctx.getPathParams("id")
      db= open("sqlite.db", "", "", "")

    db.exec(sql"DELETE FROM todo WHERE id = ?", id)
    db.close()
    resp redirect("/")