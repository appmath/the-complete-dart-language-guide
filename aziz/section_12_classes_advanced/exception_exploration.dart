class InputException implements Exception {
  InputException({required this.cause});

  final String cause;
}

class ValidationException implements Exception {
  ValidationException({required this.cause});

  final String cause;
}

throwValidationException() =>
    throw ValidationException(cause: 'Name cannot be null');
throwInputException() => throw InputException(cause: 'Input cannot be null');

void main() {
  try {
    // throwValidationException();
    throwInputException();
  } on ValidationException catch (v) {
    print('ValidationException: $v');
  } catch (v, e) {
    print('catch-all: v: $v, e: $e');
  }
}
