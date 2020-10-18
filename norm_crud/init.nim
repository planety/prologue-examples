import 
    os, 
    std/with

import norm/[model, sqlite]

import models


# init proc
func newTodo*(task = "", status = 0): Todo =
    Todo(task: task, status: status)

# create DB
proc createTables*() =
    if not fileExists("sqlite.db"):
        # create tables
        let dbConn = open("sqlite.db", "", "", "")
        dbConn.createTables(newTodo())

        # insert sample records
        var
            sample1 = newTodo("Nim lang", 0)
            sample2 = newTodo("Prologue web framework", 0)
            sample3 = newTodo("Let's start to study Prologue web framework", 1)

        with dbConn:
            insert sample1
            insert sample2
            insert sample3

