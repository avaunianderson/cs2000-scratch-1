use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

blue-sq = rectangle(40, 40, "solid", "blue")

#approach without definition
above(rectangle(40, 40, "solid", "blue"),
  rectangle(40, 40, "solid", "blue"))

  #approach with definitions
  above(blue-sq, blue-sq)
  
  rect-2x = above(blue-sq, blue-sq)
  
  
  #without the definition
  triangle(35, "solid", "orange")
  
orange-triangle = triangle(35, "solid", "orange")

rectangle(40, 30, "solid", "black")
square(30, "solid", "green")

square-g = square(30, "solid", "green")

circle(30, "solid", "pink")

above(circle(30, "solid", "yellow"), rectangle(35, 50, "solid", "black"))
cir-blq = above(circle(30, "solid", "yellow"), rectangle(35, 50, "solid", "black"))
