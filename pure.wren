
class Pure {
  static find(sequence, predicate) {
    for (item in sequence) {
      if (predicate.call(item)) {
        return item
      }
    }
    return null
  }

  static reject(sequence, predicate) { RejectSequence.new(sequence, predicate) }

  static pluck(sequence, key) { PluckSequence.new(sequence, key) }
}

class RejectSequence is Sequence {
  construct new(sequence, fn) {
    _sequence = sequence
    _fn = fn
  }

  iterate(iterator) {
    while (iterator = _sequence.iterate(iterator)) {
      if (!_fn.call(_sequence.iteratorValue(iterator))) break
    }
    return iterator
  }

  iteratorValue(iterator) { _sequence.iteratorValue(iterator) }
}

class PluckSequence is Sequence {
  construct new(sequence, key) {
    _sequence = sequence
    _key = key
  }

  plucker(map) { map[_key] }

  iterate(iterator) { _sequence.iterate(iterator) }

  iteratorValue(iterator) { plucker(_sequence.iteratorValue(iterator)) }
}