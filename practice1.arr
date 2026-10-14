use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun check-age(age :: Number) -> Boolean:
  doc: "Returns true when the age is above or equal to 21"
  if age >= 21: true
  else: false
  end

where:
  check-age(20) is false
  check-age(21) is true
  check-age(45) is true
end

fun check-year(year :: Number) -> String:
  doc: "Returns 'Past', 'Current', or 'Future' depending on whether the year is before, equal to, or after 2026"
  if year > 2026: "Future"
  else if year == 2026: "Current"
  else: "Past"
  end
  
  
where:
  check-year(2020) is "Past"
  check-year(2026) is "Current"
  check-year(2030) is "Future"
end

fun in-range(n :: Number) -> Boolean:
  doc: "Returns true when n is between 10 and 20, inclusive"
  if (n >= 10) and (n <= 20): true
  else: false
  end
where:
  in-range(9) is false
  in-range(10) is true
  in-range(15) is true
  in-range(20) is true
  in-range(21) is false
end

fun ticket-price(age :: Number) -> Number:
  doc: "Returns 8 for ages under 12, 10 for ages 65 and up, and 15 otherwise"
  if age < 12: 8
  else if age >= 65: 10
  else: 15
  end

where:
  ticket-price(5) is 8
  ticket-price(11) is 8
  ticket-price(12) is 15
  ticket-price(40) is 15
  ticket-price(65) is 10
  ticket-price(80) is 10
end

fun find-scholars(t :: Table) -> Table:
  doc: "Find students not in Boston"

  fun is-scholar(r :: Row) -> Boolean:
    get-column(r, "campus") <> "Boston"
  end

  filter-with(t, is-scholar)
where:
  students = table: name, campus
    row: "Ajay", "Oakland"
    row: "Jason", "Boston"
    row: "Lauren", "London"
  end

  result = table: name, campus
    row: "Ajay", "Oakland"
    row: "Lauren", "London"
  end

  find-scholars(students) is result
end

fun add-bad-year-column(t :: Table) -> Table:
doc: "Find if cost exceeds the revenue"

fun is-bad-year(r :: Row) -> Boolean
  build-column(t, "bad-year", is-bad-year)
  where:
  data = table: year, costs, revenues
        row: 2020, 100, 150
        row: 2021, 200, 150
        row: 2022, 150, 150
      end
      results = table: year, costs, revenues, bad-year
        row: 2020, 100, 150, false
        row: 2021, 200, 150, true
        row: 2022, 150, 150, false
      end 
      add-bad-year-column(data) is result
      end