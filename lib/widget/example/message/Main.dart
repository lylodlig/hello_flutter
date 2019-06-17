import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/example/message/Input.dart';
import 'package:hello_flutter/widget/example/message/MessageList.dart';

class MainWidget extends StatelessWidget {
  final messageListKey =
      GlobalKey<MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("添加"),
          onPressed: () async {
            // 获取上个界面返回的数据
            final result = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => InputForm()));
            // 这里的currentState就是MessageListState，所以可以调用addMsg方法
            var currentState = messageListKey.currentState;
            currentState.addMsg(result);
          },
        ),
        Expanded(
            child: MessageList(
          key: messageListKey,
        )),
      ],
    );
  }
}
