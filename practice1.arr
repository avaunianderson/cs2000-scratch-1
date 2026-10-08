use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun check-age(d :: Number) -> String:
  doc: "Given number determines is age is above or equal or 21"
  if d >= 21: "true"
  else: "false"
  end
where:  check-age(21) is "true"
  check-age(20) is "false"
  check-age(25) is "true"
end

fun check-year(n :: Number) -> String:
  doc: "Given year determines if it was in the past, present, or future."
  if n <= 2025: "Past"
  else if n == 2026: "Present"
    else: "Future"
    end
    where: check-year(2002) is "Past"
    check-year(2026) is "Present"
    check-year(2070) is "Future"
    check-year(1987) is "Past"
  end
  
