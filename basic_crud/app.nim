import prologue
import views


# Create default settings
let settings = newSettings()

# Create instance
var app = newApp(settings = settings)

# Create routes
app.addRoute("/", listItems)
app.addRoute("/create", createItem)
app.addRoute("/read/{item}", readItem)
app.addRoute("/update/{id}", updateItem)
app.addRoute("/delete/{id}", deleteItem)

# Run instance
app.run()
