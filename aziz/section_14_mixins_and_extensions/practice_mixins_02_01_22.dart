mixin Swimmer {
  void swim() => print('swim');
}

mixin Flyer {
  void fly() => print('fly');
}

class Animal with Swimmer, Flyer {}

void main() {
  final animal = Animal();
  animal.swim();
  animal.fly();
}
