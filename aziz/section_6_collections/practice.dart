void main() {
  List<String> cities = ['London', 'Paris', 'Moscow'];
  cities.sort();
  print('Sorted: $cities');
  Set<int> set = {1, 2, 3};

  Set<String> euCountries = {'Italy', 'UK', 'Russia'};
  Set<String> asianCountries = {'India', 'Japan', 'Russia'};
  Set<String> difference = euCountries.difference(asianCountries);
  print('difference: $difference');

  Map<String, Object> cityMap = {
    'First': 'One',
    'Second': 2,
    'Third': 3,
  };
  print('cityMap: $cityMap');
  var first = cityMap['First'];
  print('first.runtimeType: ${first.runtimeType}');
  print(first);

  for (var cityKey in cityMap.keys) {
    print(cityMap[cityKey]);
  }
  for (var entry in cityMap.entries) {
    print('${entry.key} : ${entry.value}');
  }

  const ratings = [4.0, 3.5, 4.5];
  final restaurant = {
    'name': 'Sonora',
    'cuisine': 'Mexican',
    if (ratings.length > 2) ...{
      'ratings': ratings,
      'isPopular': true,
    },
  };

  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.0],
    },
    if (restaurant.isNotEmpty) restaurant,
  ];

  print('Restaurants');
  for (var restaurant in restaurants) {
    for (var entry in restaurant.entries) {
      print('${entry.key}: ${entry.value}');
    }
  }

  const addBlue = true;
  const addRed = true;
  final someColors = ['black', 'white', if (addBlue) 'blue', if (addRed) 'red'];
  print('someColors: $someColors');

  final moreColors = [
    'brown',
    for (var color in someColors) color,
  ];

  print('moreColors: $moreColors');

  bool addColors = true;
  final colors = ['black', 'white', 'brown'];
  final allColors = [
    'yellow',
    'purple',
    if (addColors) ...colors,
  ];

  print('allColors: $allColors');

  /// End
}
