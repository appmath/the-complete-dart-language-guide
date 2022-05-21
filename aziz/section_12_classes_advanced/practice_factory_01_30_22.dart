class Person {
  Person({required this.name, required this.age});
  final String name;
  final int age;
// TODO: Implement fromJson
  factory Person.fromJson(Map<String, Object> json) {
    var name = json['name'];
    var age = json['age'];
    if (name is String && age is int) {
      return Person(name: name, age: age);
    } else {
      throw UnsupportedError('Invalid name or age');
    }
  }

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }

  // TODO: Implement toJson
  Map<String, Object> toJson() => {
        'name': name,
        'age': age,
      };
}

void main() {
  final person = Person.fromJson({
    'name': 'Aziz',
    'age': 59,
  });
  print('person: $person');

  final json = person.toJson();
  print('json: $json');
}
// - Implement a factory `fromJson` constructor so that it's possible to create `Person` instances from a map of key-value pairs. This should handle the case where the `name` and `age` values are missing or have the wrong type.
// - Implement a `toJson()` method so that a `Person` instance can be converted back to a `Map<String, Object>`.
//
