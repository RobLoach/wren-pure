import "please" for Please
import "../pure" for Pure

{
  // Find first match
  var even = Pure.find(1..4) { |num|
    return num % 2 == 0
  }
  Please.equal(even, 2)
}

{
  // null if no match exists
  var big = Pure.find(1..4) { |num|
    return num > 5
  }
  Please.equal(big, null)
}

{
  // Get sequence _without_ values passing the predicate
  var odds = Pure.reject(1..5) { |num|
    return num % 2 == 0
  }
  Please.equal(1, odds.toList[0])
  Please.equal(3, odds.toList[1])
  Please.equal(5, odds.toList[2])
}

{
  // Extract sequence of property values
  var list = [{
    "name": "matt",
    "age": 23
  }, {
    "name": "mark",
    "age": 18
  }]
  var names = Pure.pluck(list, "name").toList
  Please.equal(names[0], "matt")
  Please.equal(names[1], "mark")
}

{
  Please.equal(Pure.max((1..4).toList), 4)
}

{
  var list = [{
    "name": "harden",
    "ppg": 27.4
  }, {
    "name": "curry",
    "ppg": 23.8
  }]
  var max = Pure.max(list) { |player| player["ppg"] }
  Please.equal(max, list[0])
}

{
  Please.equal(Pure.min((1..4).toList), 1)
}

{
  var combatless = [{
    "name": "bea5",
    "xp": 68952810
  }, {
    "name": "Z o D",
    "xp": 242195672
  }]
  var min = Pure.min(combatless) { |player| player["xp"]}
  Please.equal(min, combatless[0])
}

{
  Please.equal(Pure.first((1..4).toList), 1)
}

{
  Please.equal(Pure.last((1..4).toList), 4)
}

{
  var list = Pure.initial((1..4).toList)
  Please.equal(list.count, 3)
  Please.equal(Pure.last(list), 3)
}

{
  var list = Pure.tail((1..4).toList)
  Please.equal(list.count, 3)
  Please.equal(Pure.first(list), 2)
}

{
  var numbers = Pure.without([1, 2, 3], 2)
  Please.equal(numbers.count, 2)
  Please.equal(numbers[1], 3)
}

{
  var numbers = Pure.without([1, 2, 3], [1, 2])
  Please.equal(numbers.count, 1)
  Please.equal(numbers[0], 3)
}

IO.print("All tests pass!")
