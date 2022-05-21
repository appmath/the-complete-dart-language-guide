//                         Object?
//                   |          |             |
//                Iterable     Num           Null
//                   |        |     |          |
//                  List     int  double       |
//                   |        |     |          |
//                   ---------------------------
//                   |         Never           |
//                   ---------------------------
//

// Using null safety:
import 'dart:ffi';

requireStringNotObject(String definitelyString) {
  print(definitelyString.length);
}

// main() {
//   Object maybeString = 'it is';
//   requireStringNotObject(maybeString as String);
//
//   print('filterEvens([1, 2, 3, 4]): ${filterEvens([1, 2, 3, 4])}');
// }

// Without null safety:
List<int> filterEvens(List<int> ints) {
  return ints.where((n) => n.isEven).toList();
}

// Instance fields must either have an initializer at the declaration, use an
// initializing formal, or be initialized in the constructor’s initialization
// list. That’s a lot of jargon. Here are the examples:
class SomeClass {
  int atDeclaration = 0;
  int initializingFormal;
  int initializationList;

  SomeClass(this.initializingFormal) : initializationList = 0;
}

// Type Promotion
// With (or without) null safety:
bool isEmptyList(Object object) {
  if (object is List) {
    return object.isEmpty;
  } else {
    return false;
  }
}

bool isEmptyList2(Object object) {
  if (object is! List) return false;
  return object.isEmpty;
}

// Using null safety:
int tracingFibonacci(int n) {
  final int result;
  if (n < 2) {
    result = n;
  } else {
    result = tracingFibonacci(n - 2) + tracingFibonacci(n - 1);
  }

  print(result);
  return result;
}

String makeCommand(String executable, [List<String>? arguments]) {
  if (arguments == null) return executable;
  var result = executable;
  return result + ' ' + arguments.join(' ');
}

// Using null safety:
String checkList(List<Object>? list) {
  if (list == null) return 'No list';
  if (list.isEmpty) {
    return 'Empty list';
  }
  return 'Got something';
}

// void main() {
//   String? notAsString = null;
//
//   print(notAsString?.length);
//   String? isNull = null;
//   print(isNull!.length);
// }

class HttpResponse {
  final int code;
  final String? error;

  HttpResponse.ok()
      : code = 200,
        error = null;

  HttpResponse.error()
      : code = 404,
        error = 'Not Found';

  @override
  String toString() {
    if (code == 200) return 'OK';
    return 'Error $code ${error!.toUpperCase()}';
  }
}

// late modifier
//// 1) “enforce this variable’s constraints at runtime instead of at compile time”. It’s almost like the word “late” describes when it enforces the variable’s guarantees.

//// 2) Lazy initialization:
class Weather {
  late int _temperature = _readThermometer();
  late final int temp;

  // Assume it's an expensive operation
  int _readThermometer() => 5;
}

//// 3) Late final variables
class Weather2 {
  late final int temp;

  void initX() {
    temp = 5;
  }
}

// Using null safety, incorrectly:
class Coffee {
  String? _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  void checkTemp() {
    if (_temperature != null) {
      print('Ready to serve ' + _temperature! + '!');
    }
  }

  void checkTemp2() {
    var temp = _temperature;
    if (temp != null) {
      print('Ready to serve ' + temp + '!');
    }
  }

  String serve() => _temperature! + ' coffee';
}

class Box<T> {
  final T object;

  Box(this.object);
}

class Box2<T> {
  T? object;

  Box2.empty();
  Box2.full(this.object);

  T unbox() => object as T;
}

main() {
  Box<String>('a string');
  Box<int?>(null);

  var box = Box2<int?>.full(null);
  print('box.unbox(): ${box.unbox()}');

  Map<String, String> map = {'key': 'value'};
  print(map['key']!.length); // Error.
}
