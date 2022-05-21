///////
///////
Future<String> fetchUserOrder() => Future.delayed(
      Duration(seconds: 5),
      () => 'Delayed Cappuccino',
      // () => throw Exception('Out of milk'),
    );

Future<String> fetchUserOrder2() => Future.value('Espresso');
Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));

Future<void> main() async {
  print('Program started');
  try {
    var order = await fetchUserOrder();
    print('order: $order');

    var order2 = await fetchUserOrder2();
    print('order2: $order2');

    var order3 = await fetchUserOrder3();
    print('order3: $order3');
  } catch (e) {
    print(e);
  } finally {
    print('Finally done!');
  }
}
