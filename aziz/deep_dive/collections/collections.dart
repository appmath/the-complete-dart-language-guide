void main() {
  const names = <String>['Max', 'John', 'Sara', 'Peter'];

  List<String> letters = [];
  names.forEach((name) => letters.add(name.split('').first));
  print('{letters.join()}: ${letters.join()}');

  String firstLetters =
      names.fold('', (prev, letter) => prev + letter[0].toUpperCase());
  print('firstLetters: $firstLetters');

  const nums = [20, 30, 55, 110];
  int sum = nums.fold(0, (prevNum, num) => prevNum + num);
  print('sum: $sum');

  List<Friend> friends = [
    Friend(name: 'Aziz', age: 58),
    Friend(name: 'Saad', age: 18),
    Friend(name: 'Bill', age: 45),
  ];

  int totalAge = friends.fold(0, (prev, friend) => prev + friend.age);
  print('totalAge: $totalAge');
}

class Friend {
  final String name;
  final int age;

  Friend({required this.name, required this.age});
}
