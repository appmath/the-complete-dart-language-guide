void main() {
  positionalOptionalParams('Jane');
  namedOptionalParams('John', total: 20);
}

void positionalOptionalParams(String name, [int total = 0]) {
  print('name: $name ,  total: $total');
}

void namedOptionalParams(String name, {int total = 0}) {
  print('name: $name ,  total: $total');
}
