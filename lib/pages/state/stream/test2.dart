import 'dart:async';

void main() {
  var s = Stream.fromFuture(Future.delayed(Duration(seconds: 2), () {
    return "测试";
  }));
  final sc = StreamController();
  sc.addStream(s);
  sc.stream.listen((data) {
    print(data);
    sc.close();
  });
}
