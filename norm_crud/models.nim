import norm/model


type
    Todo* = ref object of Model
        task*: string
        status*: int