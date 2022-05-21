class Person {
  Person({required this.name, required this.age});
  final String name;
  final int age;

  factory Person.fromJson(Map<String, Object> json) {
    final jsonName = json['name'];
    String personName;

    if (jsonName is String) {
      personName = jsonName;
    } else {
      throw UnsupportedError('name has to be a string');
    }
    final jsonAge = json['age'];
    int personAge;
    if (jsonAge is int) {
      personAge = jsonAge;
    } else {
      throw UnsupportedError('name has to be a string');
    }
    return Person(name: personName, age: personAge);
  }

  Map<String, Object> toJson() => {
        'name': name,
        'age': '$age',
      };

  void printPerson() {
    print('name: $name, age: $age');
  }
  // TODO: Implement fromJson
  // TODO: Implement toJson
}

void main() {
  final person = Person.fromJson({
    'name': 'Andrea',
    'age': 36,
  });

  person.printPerson();
  final json = person.toJson();
  print(json);
}
