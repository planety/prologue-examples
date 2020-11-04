import 
    json

import
    allographer/schema_builder,
    allographer/query_builder


proc initSchemas*(): bool =

    # Schema for Todo
    schema([
        table("todo",[
            Column().increments("id"),
            Column().string("task"),
            Column().integer("status"),
        ], true)
    ])

    # Init with data
    let todo = rdb().table("todo").getPlain()
    if todo.len == 0:
        rdb()
        .table("todo")
        .insert(
            @[%*{
                "task": "Nim lang",
                "status": 0
            },%*{
                "task": "Prologue web framework",
                "status": 0
            },%*{
                "task": "Let's start to study Prologue web framework",
                "status": 1
            }]
        )

    return true
