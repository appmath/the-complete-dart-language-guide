class PositiveInt {
  final int value;

  PositiveInt({required this.value})
      : assert(value >= 0, 'value cannot be negative');

  void signIn(String email, String password) {
    assert(email.isNotEmpty);
    assert(password.isNotEmpty);
  }
}

void main() {
  final posInt = PositiveInt(value: -1);
}
