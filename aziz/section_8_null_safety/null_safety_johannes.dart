// https://www.youtube.com/watch?v=5Ro-CZ8Msno&t=20s

String? variable = null;
String? value = 'Value';
String? bornAnull = null;
List<int>? list = [1, 2];
List<int>? nullList = null;
late String lateToTheParty;

late String lateOne; // throws exception if no value is assigned to it

void main() {
  print(variable?.toLowerCase());
  print(variable?.length);
  print(value ?? 'xyz');

  bornAnull ??= 'One';
  print(bornAnull);

  print([...?list, 3]);
  print([...?nullList, 3]);

  // print(variable?.toLowerCase()); throws exception
  // print(variable?.length); throws exception
  lateToTheParty = 'late'; // otherwise, it will throw an exception.
}
