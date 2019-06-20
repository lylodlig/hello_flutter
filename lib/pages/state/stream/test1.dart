import 'dart:async';

void main(){
  // 单订阅的例子
  final streamController=StreamController();
  // 初始化监听器
  streamController.stream.listen((data)=>print(data));

  // 向stream添加数据
  streamController.sink.add("name");
  streamController.sink.add("name2");

  streamController.close();
}