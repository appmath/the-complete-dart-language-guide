class Person {
  final String name;
  final int age;
  final int height;

  Person({required this.name, required this.age, required this.height});

  void printDescription() {
    print('My name is $name. I\'m $age years old, I\'m $height meters tall.');
  }
}

main() {
  final person = Person(name: 'Aziz', age: 58, height: 175);
  person.printDescription();
}
