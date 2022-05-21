void main() {
  // static: class instance (member is available on the class itself)
  // final (modifies variables): requires an initializer. Once assigned a value, a final variable's value cannot be changed.
  // const (modifies values), interesting properties and restrictions:
  //       1) Uses data that's available at compile time. 1 + 2 but not DateTim.now()
  //       2) Deeply and transitively immutable. const collection will not chang
  //       3) They canonicalized. For any given const value, a single const object will be created and reused, no matter how many times the const expressions is evaluated.
  // EXAMPLES
  final cities = <String>['London', 'Paris', 'Casa'];

  // ----- final ------
  // Compile time error for reassignment
  final finalCities = <String>['London', 'Paris', 'Casa'];
  // finalCities = <String>['Paris'];

  // ----- const ------
  // Reassignment: compile time error:
  const constCities = <String>['London', 'Paris', 'Casa'];
  // constCities = <String>['London'];

  // Modification: runtime error: Unsupported operation: Cannot modify an unmodifiable list
  // constCities[1] = 'Casa';
}
