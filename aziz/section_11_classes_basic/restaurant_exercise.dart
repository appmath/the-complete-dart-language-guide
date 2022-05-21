class Restaurant {
  const Restaurant({
    required this.name,
    required this.cuisine,
    required this.ratings,
  });

  final String name;
  final String cuisine;
  final List<double> ratings;

  int get totalNumber => ratings.length;

  double? averRating() {
    if (ratings.isEmpty) {
      return null;
    }
    return ratings.reduce((value, element) => value + element) / ratings.length;
  }
}

main() {
  final restaurant =
      Restaurant(name: 'Zizi', cuisine: "Asian", ratings: [3, 4, 5]);

  print('restaurant.totalNumber: ${restaurant.totalNumber}');
  print('restaurant.averRating(): ${restaurant.averRating()}');
}
