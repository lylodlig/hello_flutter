import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/example/message/Message.dart';

class MessageList extends StatefulWidget {
  // 构造函数，具名参数
  MessageList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MessageListState();
  }
}

class MessageListState extends State<MessageList> {
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final subtitle =
              DateTime.fromMillisecondsSinceEpoch(messages[index].timestamp)
                  .toLocal()
                  .toIso8601String();
          return ListTile(
            title: Text(messages[index].message),
            subtitle: Text(subtitle),
          );
        });
  }

  void addMsg(Message message) {
    setState(() {
      messages.add(message);
    });
  }
}
