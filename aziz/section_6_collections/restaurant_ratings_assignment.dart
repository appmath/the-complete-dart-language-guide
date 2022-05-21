void main() {
  const restaurants = {
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
      'ratings': [5.0, 5.0, 5.0],
    }
  };

  for (var restaurant in restaurants) {
    var ratings = restaurant['ratings'] as List<double>;
    var ratingTotal = 0.0;
    for (var rating in ratings) {
      ratingTotal += rating;
    }
    var average = ratingTotal / ratings.length;
    print(
        'Average rating for ${restaurant['name']}: ${average.toStringAsFixed(1)}');
    //
  }
}
