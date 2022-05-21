class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
    print('Added $item: $_items');
  }

  T pop() {
    final removeLast = _items.removeLast();
    print('Removed last item: $_items');

    return removeLast;
  }
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.pop();
}
