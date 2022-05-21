Future<String> fetchUserOrder() => Future.delayed(
      Duration(seconds: 2),
      () => throw Exception('Out of milk'),
    );

Future<void> main() async {
  final fetcher = await fetchUserOrder()
      .then((order) => print('Order is ready $order'))
      .catchError((error) => print(error))
      .whenComplete(() => print('done'));
}
