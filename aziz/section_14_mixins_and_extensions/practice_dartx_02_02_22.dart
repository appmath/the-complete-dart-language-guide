import 'package:dartx/dartx.dart';

class Dog {
  final String name;
  final int age;

  Dog({required this.name, required this.age});

  @override
  String toString() {
    return '$name, $age';
  }
}

void main() {
  final list = [0, 1, 2, 3, 4, 5];
  final unorderedList = [5, 0, 4, 1, 3, 2];
  print('last: ${list.slice(-1)}');
  print('list.slice: ${list.slice(1, -3)}');
  print('list.slice: ${list.slice(3)}');

  final dogs = [
    Dog(name: "Tom", age: 3),
    Dog(name: "Charlie", age: 7),
    Dog(name: "Bark", age: 1),
    Dog(name: "Cookie", age: 4),
    Dog(name: "Charlie", age: 2),
  ];

  var sortedDogs =
      dogs.sortedBy((dog) => dog.name).thenByDescending((dog) => dog.age);
  print('sortedDogs: \n${sortedDogs.join('\n')}');

  final oddItems = list
      .asMap()
      .entries
      .where((entry) => entry.key.isOdd)
      .map((entry) => entry.value)
      .toList();
  oddItems.forEach(print);

  final odds = list.whereIndexed((x, index) => index.isOdd).toList();
  print('odds: $odds');

  list.forEachIndexed((element, index) => print('$index: $element'));

  final sortedList = [...unorderedList]..sort();
  print('{sortedList}: ${sortedList.join(', ')}');
  print('{unorderedList}: ${unorderedList.join(', ')}');

  final xSortedList = unorderedList.sortedDescending();
  print('xSortedList: $xSortedList');

  final sliceOne = 'awesomeString'.slice(0, 6);
  print('sliceOne: $sliceOne');
}
