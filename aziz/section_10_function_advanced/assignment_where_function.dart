// where exercise

typedef IsOdd<T> = bool Function(T);

void main() {
  List list = [1, 2, 3, 4, 5];
  var predicate = (num) => num % 2 == 1;
  var oddNums = where(list, predicate);
  print('oddNums: $oddNums');
}

List<T> where<T>(List<T> list, IsOdd isOdd) {
  var result = <T>[];
  for (var num in list) {
    if (isOdd(num)) {
      result.add(num);
    }
  }
  return result;
}

// typedef Odd = bool Function(int);
//
// void main() {
//   List<int> list3 = [1, 2, 3, 4];
//   var oddNumsFunction = (num) => (num % 2 == 1);
//   var oddNums = where<int>(list3, oddNumsFunction);
//   print('oddNums: $oddNums');
// }
//
// List<T> where<T>(List<T> list, Odd filter) {
//   var result = <T>[];
//   list.forEach((element) {
//     if (filter(element as int)) {
//       result.add(element);
//     }
//   });
//   return result;
// }
