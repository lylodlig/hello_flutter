//int foo(int x) {
//  return 0;
//}

//void main() {
//  print(foo(2)); //2
//  print(foo(1, 2)); //3
//}
//
////Dart 也支持可选参数
//int foo(int x, [int y]) {
//  // 是的，int 也可以是 null
//  if (y != null) {
//    return x + y;
//  }
//  return x;
//}

void main() {
  print(foo(x: 1, y: 2));
  //  具名参数的顺序可以是任意的
  print(foo(y: 3, x: 4));
  //  所有的具名参数都是可选的，这个调用是合法的，但它会导致  foo()  在运行时抛异常
  print(foo());
}

int foo({int x, int y}) {
  return x + y;
}
