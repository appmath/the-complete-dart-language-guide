void main() {
  // Default positional arguments;
  // list.

  // foo(1);

  bar();
  bar();
  bar();
  print('counter: $counter');
}

var counter = 1;

void bar() {
  print('*' * counter);
  counter++;
}

//  foo(1);
void foo(int a, [int b = 4]) {
  print('a: $a, b: $b');
}

int sum(int x, int y) {
  return x + y;
}

int sum2(int x, int y) => x + y;
