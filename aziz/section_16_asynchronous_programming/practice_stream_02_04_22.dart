void main() {
  Stream.fromIterable([1, 2, 3]);
  Stream.value(10);
  Stream.error(Exception('something went wrong'));
  const Stream.empty();
  Stream.fromFuture(
      Future.delayed(const Duration(seconds: 2), () => print('42')));
  Stream.periodic(Duration(seconds: 1), (index) => index).forEach(print);
}
