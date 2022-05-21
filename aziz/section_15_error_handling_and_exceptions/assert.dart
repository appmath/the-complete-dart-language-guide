class PositiveInt {
  PositiveInt({required this.value})
      : assert(value >= 0, 'Value cannot be negative');

  final int value;
}

void signIn(String email, String password) {
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main() {
  // final invalidAge = PositiveInt(value: -1);
  // print('invalidAge: $invalidAge');
  signIn('', '');
}
