dynamic a;
Object? b;

main() {
  a = "";
  b = "";
  printLengths();
}

printLengths() {
  // no warning
  print(a.length);

  // warning:
  // The getter 'length' is not defined for the class 'Object'
  // print(b?.length);
}
