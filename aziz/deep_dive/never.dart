// User data class
class User {
  final String email;
  final String password;

  const User({
    required this.email,
    required this.password,
  });

  @override
  String toString() => 'User {email: $email, password: $password}';
}

// Helper function for required field validation
Never isRequired(String property) {
  throw ArgumentError('$property is required.');
}

void main() {
  String? email;
  String? password;
  // ...
  // Some code to get email and password
  // ...
  if (email == null || email.isEmpty) isRequired('email');
  if (password == null || password.isEmpty) isRequired('password');
  final user = User(email: email, password: password);
  // ...
  // Do something with the user data
  // ...
}
