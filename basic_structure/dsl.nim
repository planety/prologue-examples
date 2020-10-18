import prologue


app.get "/":
  resp "<h1>Hello, Prologue!</h1>"


var app = newApp()
app.run()