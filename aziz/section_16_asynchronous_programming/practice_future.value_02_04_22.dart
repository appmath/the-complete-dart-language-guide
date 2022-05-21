Future<String> fetchUserOrder() => Future.delayed(
      Duration(seconds: 2),
      () => 'Cappuccino',
    );
Future<String> fetchUserOrder2() => Future.value('Espresso');
Future<String> fetchUserError() => Future.error('No coffee');

Future<void> main() async {
  try {
    final fetcher = await fetchUserOrder();
    print('fetcher: $fetcher');

    final fetcher2 = await fetchUserOrder2();
    print('fetcher2: $fetcher2');

    final fetcherError = await fetchUserError();
    print('fetcherError: $fetcherError');
  } catch (e) {
    print(e);
  } finally {
    print('Done!');
  }
}
