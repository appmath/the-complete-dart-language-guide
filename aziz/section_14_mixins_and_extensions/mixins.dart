class Animal with Breathing {}

mixin Swimming {
  void swim() => print('swim');
}
mixin Breathing {
  void breath() => print('breath');
}

class Fish extends Animal with Swimming {}

class Human extends Animal with Swimming {}

void main() {
  final fish = Fish();
  fish.swim();
  fish.breath();
}
