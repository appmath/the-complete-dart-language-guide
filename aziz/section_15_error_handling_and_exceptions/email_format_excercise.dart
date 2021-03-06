class EmailAddress {
  EmailAddress(this.email) {
    if (email.isEmpty) {
      throw FormatException('email cannot be empty');
    }
    if (!email.contains('@')) {
      throw FormatException('$email doesn\'t contain the @symbol');
    }
  }

  final String email;

  @override
  String toString() {
    return '$email';
  }
}

void main() {
  try {
    print(EmailAddress('me@example.com'));
    print(EmailAddress('example.com'));
    print(EmailAddress(''));
  } on FormatException catch (e) {
    print(e);
  }
//   // Desired output:
//   // me@example.com
//   // FormatException: example.com doesn't contain the @ symbol
}

// ## Exercise: Email validation
//
// Implement a simple `EmailAddress` class that takes an email `String` as a constructor argument.
//
// This class should throw a `FormatException` if:
//
// - it is initialized with an empty email
// - the email doesn't contain a `@` character
//
// Then, test this class with the following code:
//
// ```dart
// void main() {
//   try {
//     print(EmailAddress('me@example.com'));
//     print(EmailAddress('example.com'));
//     print(EmailAddress(''));
//   } on FormatException catch (e) {
//     print(e);
//   }
//   // Desired output:
//   // me@example.com
//   // FormatException: example.com doesn't contain the @ symbol
// }
// ```
