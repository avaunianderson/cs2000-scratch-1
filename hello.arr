use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Prep:
  | ready
  | task(action :: String, minutes :: Number, rest :: Prep)
end

data Dish:
  | ingredient(name :: String, prep :: Prep)
  | combine(step :: String, minutes :: Number, part-a :: Dish, part-b :: Dish)
end

tortillas = ingredient("tortillas", task("warm", 2, ready))
beans = ingredient("black beans", task("rinse", 1, task("heat", 6, ready)))
tomato = ingredient("tomato", task("wash", 1, task("dice", 4, ready)))
onion = ingredient("onion", task("peel", 1, task("dice", 3, ready)))
cilantro = ingredient("cilantro", task("wash", 1, task("chop", 2, ready)))

salsa = combine("stir", 2, combine("toss", 1, tomato, onion), cilantro)
filling = combine("fill", 3, tortillas, beans)
tacos = combine("top", 1, filling, salsa)


fun prep-minutes(p :: Prep) -> Number:
  doc: "Returns how many minutes they take in all."
  cases (Prep) p:
    |ready => 0
    |task(actions, minutes, rest) => minutes + prep-minutes(rest)
  end
where:
  prep-minutes(ready) is 0
  prep-minutes(task("warm", 2, ready)) is 2
  prep-minutes(task("wash", 1, task("dice", 4, ready))) is 5
end

fun solo-minutes(d :: Dish) -> Number:
  doc: "Returns the time it takes a cook to make."
  cases (Dish) d:
    |ingredient(name, prep) => prep-minutes(prep)
    |combine(step, minutes, part-a, part-b) => minutes + solo-minutes(part-a) + solo-minutes(part-b)
  end
where: 
  solo-minutes(tomato) is 5
  solo-minutes(filling) is 12
  solo-minutes(salsa) is 15
  solo-minutes(tacos) is 28
end

fun crew-minutes(d :: Dish) -> Number:
  doc: "Returns how many minutes it takes to make with enough helpers."
  cases (Dish) d:
    |ingredient(name, prep) => prep-minutes(prep)
    |combine(step, minutes, part-a, part-b) =>
      if crew-minutes(part-a) > crew-minutes(part-b):
        minutes + crew-minutes(part-a)
      else: 
        minutes + crew-minutes(part-b)
      end
  end
where: 
  crew-minutes(tomato) is 5
  crew-minutes(filling) is 10
  crew-minutes(salsa) is 8
  crew-minutes(tacos) is 11
end


fun prep-report(d :: Dish) -> String:
  doc: "returns how long it takes alone or with help to cook."
  "Alone: " + num-to-string(solo-minutes(d)) + " min" + ", with helpers: " + num-to-string(crew-minutes(d)) + " min"
where:
  prep-report(tacos) is "Alone: 28 min, with helpers: 11 min"
prep-report(salsa) is "Alone: 15 min, with helpers: 8 min"
prep-report(tortillas) is "Alone: 2 min, with helpers: 2 min"
end

fun ingredients-needing(d :: Dish, action :: String) -> List<String>:
  doc: "returns ingredients whose prep includes the same thing."
  cases (Dish) d:
    |ingredient(name, prep) => 