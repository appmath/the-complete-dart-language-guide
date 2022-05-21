// From this video: https://www.youtube.com/watch?v=RKcgK6kIcjw
void main() {
  List list = ['steve', 'bill', 'musk'];
  Map map = list.asMap();

  int x = 0;
  Map map2 = {for (var name in list) '$name': x++};
  print('map2: $map2');

  Map map3 = {for (var i = 0; i < list.length; i++) i: '${list[i]}'};
  print('map3: $map3');
}
