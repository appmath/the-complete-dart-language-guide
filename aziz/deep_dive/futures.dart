void main() {
  var myFuture = Future(() {});

  print('This runs first!');
  myFuture
      .then((_) => print('...'))
      .catchError((onError) {})
      .then((_) => print('After error received'));
}
