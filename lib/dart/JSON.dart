import 'dart:convert';

void main() {
  final p = Point(2, 3);

  print(p.toJson());

  var point = Point(2, 12);
  // 把对象转为Json
  var pointJson = json.encode(point);
  print(pointJson);
  
  // 把json转为对象
  print(json.decode(pointJson));

}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  // 把对象转为JSON
  Map<String, dynamic> toJson() => {'x': x, 'y': y};
}
