import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/message/Message.dart';

class MessageList extends StatefulWidget {
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
