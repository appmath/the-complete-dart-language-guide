// ## Exercise: Range Extension
//
// Given the following (incomplete) program:
//

void main() {
  for (var i in 1.rangeTo(0)) {
    print(i);
  }
  // output: [1, 2, 3, 4, 5]
}
// ```
//
// Create an extension on `int` that implements a `rangeTo` method.
//
// This method should take an `int other` argument, and use it to return a
// list containing all the integer values inside the range in increasing order.
//
// If the `other` argument is less than the initial value, the method should return an empty list.

extension on int {
  List rangeTo(int other) {
    if (other < this) {
      return [];
    }
    final list = [];
    for (var i = this; i <= other; ++i) {
      list.add(i);
    }
    return list;
  }
}
