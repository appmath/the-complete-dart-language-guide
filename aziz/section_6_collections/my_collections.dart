void main() {
  var list1 = [1, 2, 3];
  var copy = [...list1];
}

void list() {
  // List<String> cities = ['London', 'Paris', 'Casa'];

  // List<String> cities = ['London', 'Paris', 'Casa'];
  var cities = <String>['London', 'Paris', 'Casa'];

  print('first: ${cities.first}');
  print('last: ${cities.last}');
  cities.insert(cities.length, 'Phoenix');
  print('last: ${cities.last}');
  print('Cities: $cities');
}

void howFinalWorks() {
  final cities = <String>['London', 'Paris', 'Casa'];

  // Compile time error for reassignment and modification
  // final cities = <String>['London', 'Paris', 'Casa'];
  // cities[1] = 'Casa';

  print('Cities: $cities');
}

void howConstWorks() {
  const cities = <String>['London', 'Paris', 'Casa'];

  // Reassignment: compile time error:
  // const cities = <String>['London', 'Paris', 'Casa'];

  // Modification: runtime error: Unsupported operation: Cannot modify an unmodifiable list
  // cities[1] = 'Casa';

  print('Cities: $cities');
}

void set() {
  var euCountries = {'Italy', 'UK', 'Russia'};
  print('EuCountries: $euCountries');

  print('Element at 0: ${euCountries.elementAt(0)}');

  euCountries.add('Spain');
  print('Added Spain: $euCountries');

  euCountries.remove('Spain');
  print('Removed Spain: $euCountries');

  // Union
  var asianCountries = {'Japan', 'Vietnam', 'Korea', 'Russia'};
  print('AsianCountries: $asianCountries');

  print(
      'union of asian and eu countries: ${asianCountries.union(euCountries)}');
  print(
      'intersection(other) of asian and eu countries: ${asianCountries.intersection(euCountries)}');
  print(
      'difference(other) of asian and eu countries: ${asianCountries.difference(euCountries)}');
}

void maps() {
  var person = {
    'name': 'Aziz',
    'age': 58,
    'height': 1.75,
  };
  Map<String, dynamic> aziz = {
    'name': 'Aziz',
    'age': 58,
    'height': 1.75,
  };
  var ziz = <String, dynamic>{
    'name': 'Aziz',
    'age': 58,
    'height': 1.75,
  };
  print('Person: $person');

  print('name: ${person['name']}');

  person['age'] = ((person['age'] ?? 0) as int) + 1;
  print('Updating age: ${person['age']}');

  print('Is my age dynamic?: ${aziz['age'] is dynamic}');

  for (var item in person.keys) {
    print('${item}: ${person[item]}');
  }

  print('\nusing entries');
  for (var entry in person.entries) {
    print('${entry.key}: ${entry.value}');
  }

  print('\nusing values');
  for (var value in person.values) {
    print(value);
  }

  print('\nusing keys');
  for (var key in person.keys) {
    print('${key}: ${person[key]}');
  }

  var restaurants = {
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [5.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.5],
    }
  };

  print('\nRestaurants');
  for (var restaurant in restaurants) {
    print(restaurant);
  }
}

void collectionIf() {
  const addBlue = false;
  const addRed = true;
  final colors = [
    'grey',
    'brown',
    if (addBlue) 'blue',
    if (addRed) 'red',
  ];
  print('Colors: $colors');
}

void collectionFor() {
  const addBlue = false;
  const addRed = true;
  const extraColors = ['yellow', 'green'];
  final colors = [
    'grey',
    'brown',
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
  ];
  print('Colors: $colors');
}

void spreadInsideMap() {
  var ratings = [5.0, 3.5, 4.5];
  var restaurant = {
    'name': 'Pizza Mario',
    'cuisine': 'Italian',
    if (ratings.length > 0) ...{
      'ratings': ratings,
      'isPopular': true,
    }
  };
  print('Restaurant: $restaurant');
}

void spread() {
  // Cool stuff
  const addExtraColors = true;
  const addBlue = false;
  const addRed = true;
  const extraColors = ['yellow', 'green'];
  final colors = [
    'grey',
    'brown',
    if (addBlue) 'blue',
    if (addRed) 'red',
    if (addExtraColors) ...extraColors,
  ];
  print('Colors: $colors');
}

// -- final ---------------------------------------------------
// Compile time error for reassignment and modification
// final cities = <String>['London', 'Paris', 'Casa'];
// cities[1] = 'Casa';

// -- const ---------------------------------------------------
// Reassignment: compile time error:
// const cities = <String>['London', 'Paris', 'Casa'];

// Modification: runtime error: Unsupported operation: Cannot modify an unmodifiable list
// cities[1] = 'Casa';
