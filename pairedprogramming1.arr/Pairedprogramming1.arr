use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun weight-class(weight :: Number) -> String:
  doc: "given weight determining the package size"
  if weight <= 8: "small"
  else if (weight > 8)  and (weight <= 16): "medium"
  else: "large"
  end
where: weight-class(1) is "small"
  weight-class(8) is "small"
  weight-class(8.5) is "medium"
  weight-class(16) is "medium"
  weight-class(16.1) is "large"
  weight-class(40) is "large"
end

fun postage(weight :: Number) -> Number:
  doc: "given weight determines postage cost"
  size = weight-class(weight)
  if size == "small": 4
  else if size == "medium": 7
  else: 12
  end
where: postage(8) is 4
  postage(10) is 7
  postage(16) is 7
  postage(20) is 12
end

fun shipping-cost(weight :: Number, is-rush :: Boolean) -> Number:
  doc: "determine the price of shipping if rushed and by weight"
  price = postage(weight)
  if is-rush == true: price * 2
  else: price
  end
where: shipping-cost(8, false) is 4
  shipping-cost(8, true) is 8
  shipping-cost(20, false) is 12
  shipping-cost(20, true) is 24
  shipping-cost(10, true) is 14
end 

fun stamp-text(weight :: Number, is-rush :: Boolean) -> String:
  doc: "creates stamp text for package based on the weight and rush"
  shipping = shipping-cost(weight, is-rush)
    size = weight-class(weight)
  if is-rush == true: num-to-string(size) +  "\nRUSH\nPay: $" + num-to-string(shipping) 
  else: num-to-string(size) + "\nstandard\nPay: $" + num-to-string(shipping)
  