use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L
import math as M

fun week-label(n :: Number) -> String:
  doc: "Returns the label of the amount of subscribers."
  if n < 0: "lost"
  else if (n >= 0) and (n <= 9): "flat"
  else: "growing"
  end
where:
  week-label(-5) is "lost"
  week-label(0) is "flat"
  week-label(10) is "growing"
end


  fun points(s :: String) -> Number:
    doc: "Retuns points."
    if s == "W": 3
    else if s == "T": 1
    else: 0
    end
  where: 
    points("W") is 3
    points("T") is 1
    points("L") is 0
  end
fun point-list(season :: List<String>) -> List<Number>:
  doc: "returns the list of points from season."
  L.map(points, season)
where:
  point-list([list: "W", "T", "L"]) is [list: 3, 1, 0]
  point-list([list: "W", "T", "T"]) is [list: 3, 1, 1]
end

fun points-after-each(scores :: List<String>) -> List<Number> block:
  doc: "returns the amount of points."
  var result = [list:]
  var total = 0
  for each(s from scores) block:
    total:= total + points(s)
    result:= result + [list: total]
  end
  result
where:
  points-after-each([list: "T", "T", "W"]) is [list: 1, 2, 5]
end