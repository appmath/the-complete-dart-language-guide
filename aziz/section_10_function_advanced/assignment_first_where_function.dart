// firstWhere

typedef IsOdd<T> = T Function(T, T);

void main() {
  List list = [1, 2, 3, 4, 5];
  var predicate = (matchNum, match) => matchNum == match;
  var firstMatch = firstWhere(list, 3, predicate, orElse: () => -1);
  print('firstMatch: $firstMatch');
}

T firstWhere<T>(List<T> list, T matchNum, IsOdd isOdd,
    {required T Function() orElse}) {
  for (var num in list) {
    if (isOdd(num, matchNum)) {
      return num;
    }
  }
  return orElse();
}
