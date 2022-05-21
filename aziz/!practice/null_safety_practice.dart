import '../deep_dive/async/streams/creating_streams_in_dart.dart';

////////// ALWAYS START FROM SCRATCH //////
////////// ALWAYS START FROM SCRATCH //////
////////// ALWAYS START FROM SCRATCH //////

void main() {
  String? str;

  // Assertion operator: maybeValue!
  // Conditional access operator: city?.toUpperCase()
  // if null operator: int value = maybeValue ?? 0;

  // Conditional access operator
  int? conditionalOpLength = str?.length;
  print('conditionalOpLength: $conditionalOpLength');

  // if null operator
  int ifNullOpLength = str?.length ?? 0;
  print('ifNullOpLength: $ifNullOpLength');

  // Assertion operator
  int? assertionOpLength = str!.length; // Throws an exception
  print('assertionOpLength: $assertionOpLength');
}

//

// Conditional assertion operator
// str?.length

// if null operator
// int value = str?.length ?? 0;

// Assertion operator Kaboom
// str!.length
