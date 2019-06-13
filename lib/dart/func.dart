import 'dart:convert';

void main() {
//  print(foo(x: 1, y: 2));
  //  具名参数的顺序可以是任意的
//  print(foo( x: 4));
  //  所有的具名参数都是可选的，这个调用是合法的，但它会导致  foo()  在运行时抛异常
//  print(foo());
//    let a=ImmutablePoint.origin.y
  int a;
  assert(a == null);

  var ab = const [1];
  ab[0] = 2;
  assert(ab[0] == 2);
}

class Point {
  final String a;

  const Point(String a) : this.a = a;
}

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}
