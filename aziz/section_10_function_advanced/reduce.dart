void main() {
  List list = [1, 2, 3, 4, 5];
  var sum = list.reduce((value, element) => value + element);
  print('sum: $sum');
}
