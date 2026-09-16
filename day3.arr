use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun welcome(Avauni) : 
  "Welcome to class," + Avauni
end
welcome("Avauni")
welcome("7")

rectangle(200, 30, "solid", "blue")
#approach with definitions
blue-rq = rectangle(200, 30, "solid", "blue")
rectangle(200, 30, "solid", "purple")
purple-rq = rectangle(200, 30, "solid", "purple")
rectangle(200, 30, "solid", "white")
white-rq = rectangle(200, 30, "solid", "white")

above(blue-rq, purple-rq)
layer-cake = above(blue-rq, purple-rq)

above(white-rq, layer-cake)
three-layer-cake = above(white-rq, layer-cake)