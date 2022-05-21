enum Color {
  white,
  black,
  orange,
}

void main() {
  Color color = Color.black;
  print(Color.values);
  switch (color) {
    case Color.black:
      print(color.name);
      break;
    case Color.white:
      print('white');
      break;
    case Color.orange:
      print('orange');
      break;
    default:
  }

  print(Color.values.byName('white'));
}
