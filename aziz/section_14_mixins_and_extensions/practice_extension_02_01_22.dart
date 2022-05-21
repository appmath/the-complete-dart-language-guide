extension on int {
  bool greaterThan(int other) => this > other;
}

void main() {
  print('5 > 4: ${5.greaterThan(4)}');
  print('1 > 10: ${1.greaterThan(10)}');
}
