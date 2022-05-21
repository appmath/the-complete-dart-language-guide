abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

class AB implements InterfaceA, InterfaceB {
  @override
  void a() {
    // TODO: implement a
  }

  @override
  void b() {
    // TODO: implement b
  }
}

abstract class Base {
  void foo();
  void bar() => print('bar');
}

class Subclass extends Base {
  @override
  void foo() {
    // TODO: implement foo
  }

  @override
  String toString() => 'Subclass{}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subclass && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
