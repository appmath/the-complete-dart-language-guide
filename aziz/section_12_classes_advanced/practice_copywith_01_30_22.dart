import 'dart:math';

import 'close_path_casscades.dart';

class Credentials {
  final String email;
  final String password;

  const Credentials({this.email = 'none', this.password = 'none'});

  Credentials copyWith({String? email, String? password}) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'Credentials{email: $email, password: $password}';
  }
}

void main() {
  const credentials = Credentials();
  final updated1 = credentials.copyWith(email: 'me@example.com');
  print('updated1: $updated1');

  final updated2 = updated1.copyWith(password: 'too-easy');
  print('updated2: $updated2');

  var closedPath = ClosedPath()
    ..lineTo(const Point(2, 3))
    ..moveTo(const Point(3, 4));
}
