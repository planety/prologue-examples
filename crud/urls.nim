import prologue

import views

let urlPatterns* = @[
  pattern("/", listItems),
  pattern("/create", newItem),
  pattern("/read/{item}", showItem),
  pattern("/update/{id}", editItem),
  pattern("/delete/{item}", deleteItem)
]