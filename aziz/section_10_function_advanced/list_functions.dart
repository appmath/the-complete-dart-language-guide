typedef Odd = bool Function(int);

void main() {
  // const list = [1, 2, 3, 4];
  // var evenNums = list.where((element) => element.isEven);
  // print('evenNums: $evenNums');
  //
  // const list2 = [1, 1, 1];
  //
  // var firstEven =
  //     list2.firstWhere((element) => element.isEven, orElse: () => 0);
  // print('firstEven: $firstEven');

  List<int> list3 = [1, 2, 3, 4];
  var oddNumsFunction = (num) => (num % 2 != 0);
  var oddNums = where(list3, oddNumsFunction);
  print('oddNums: $oddNums');
}

List<int> where(List<int> list, Odd filter) {
  List<int> result = [];
  list.forEach((element) {
    if (filter(element)) {
      result.add(element);
    }
  });
  return result;
}

///

// typedef Greet = String Function(String);
// // Not recommended, harder to read
// // typedef String Greet(String name);
//
// void main() {
//   var sayHi = (String name) => 'Welcome Mr. $name';
//   welcome(sayHi, 'Aziz');
// }
//
// void welcome(Greet greet, String name) {
//   print(greet(name));
// }
