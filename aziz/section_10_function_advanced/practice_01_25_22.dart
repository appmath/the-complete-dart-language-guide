typedef Transformer<R, T> = R Function(T);
int doubleIt(value) => value * 2;
int tripleIt(value) => value * 3;
double tripleDoubles(value) => value * 3;

void main() {
  const intList = [1, 2, 3, 4];
  const doubleList = [1.0, 2.0, 3.0, 4.0];
  const mixedTypeList = ['Hello', 1, 'Not', 3.0, true, 10];

  // TODO Revisit
  intList.forEach(print);

  print('transform: ${transform<int>(intList, doubleIt)}');
  print('tripleIt: ${transform<int>(intList, tripleIt)}');
  print('transform G: ${transformG<int, int>(intList, (num) => num * 2)}');
  print('transform G2: ${transformG2<int, int>(intList, (num) => num * 2)}');
  print(
      'tripleDoubles: ${transformG2<double, double>(doubleList, tripleDoubles)}');

  var doubled = intList.map((e) => e * 2);
  print('doubled: $doubled');

  List<int> even = intList.where((element) => element.isEven).toList();
  print('even: $even');

  int firstEven = intList.firstWhere((element) => element.isEven);
  print('firstEven: $firstEven');

  final List<int> shuffled = [...intList];
  shuffled.shuffle();
  print('shuffled: $shuffled');

  print('intList.asMap(): ${intList.asMap()}');
  print('mixedTypeList.whereType<int>(): ${mixedTypeList.whereType<int>()}');

  var rangeList = [...intList];
  rangeList.replaceRange(0, intList.length, [10, 20, 30, 40]);
  print('intList.replaceRange with 10, 20, 30, 40: $rangeList');

  var singleWhereElementEquals4 =
      intList.singleWhere((element) => element == 4);
  print('singleWhereElementEquals4: $singleWhereElementEquals4');

  print(
      'fold (sum): ${intList.fold(0, (int previousValue, newValue) => previousValue + newValue)}');
  print(
      'reduce (sum) : ${intList.reduce((value, element) => value + element)}');

  // reduce can only be used on non-empty collections with functions that returns
  // the the same type as the types contained in the collection.
  const nums = [1, 2, 3, 4];
  var sum = nums.reduce((value, element) => value + element);
  print('sum: $sum');

  // fold can be used in all cases
  const words = ['Hello', 'How are you?', 'Wow'];
  int wordsLength =
      words.fold(0, (previousValue, element) => previousValue + element.length);
  print('wordsLength: $wordsLength');

  var followedBy10and20 = intList.followedBy([10, 20]);
  print('followedBy10and200: $followedBy10and20');

  var sportsList = ['cricket', 'tennis', 'football'];
  // first, last, any, every are self-explanatory

  print('sportsList.take(2): ${sportsList.take(2)}');
  // The opposite of take is skip
  print('sportsList.ski: ${sportsList.skip(2)}');

  combiningOperators();
}

void combiningOperators() {
  const emails = [
    'abc@abc.com',
    'me@example.co.uk',
    'john@gmail.com.com',
    'katy@yahoo.com'
  ];

  const knownDomains = ['gmail.com', 'yahoo.com'];

  List<String> unknowns = emails
      .map((email) => email.split('@').last)
      .where((domain) => !knownDomains.contains(domain))
      .toList();
  print('unknowns: $unknowns');

  final unknownDomains = getUnknownDomains(emails, knownDomains);

  print('unknownDomains: $unknownDomains');
}

Iterable<String> getUnknownDomains(
    List<String> emails, List<String> knownDomains) {
  return emails
      .map((email) => email.split('@').last)
      .where((domain) => !knownDomains.contains(domain));
}

List<T> transform<T>(List<T> items, T Function(T) f) {
  List<T> result = [];
  for (var element in items) {
    result.add(f(element));
  }
  return result;
}

List<R> transformG<R, T>(List<T> items, R Function(T) f) {
  List<R> result = [];
  for (var element in items) {
    result.add(f(element));
  }
  return result;
}

List<R> transformG2<R, T>(List<T> items, Transformer f) {
  List<R> result = [];
  for (var element in items) {
    result.add(f(element));
  }
  return result;
}
