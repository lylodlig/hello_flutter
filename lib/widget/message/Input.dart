import 'package:flutter/material.dart';
import 'package:hello_flutter/widget/message/Message.dart';

class InputForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InputFormState();
  }
}

class _InputFormState extends State<InputForm> {
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: editController,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "请输入", contentPadding: EdgeInsets.all(2)),
              ),
            ),
            RaisedButton(
              child: Text("添加"),
              onPressed: () {
                final msg = Message(
                    editController.text, DateTime.now().millisecondsSinceEpoch);
                Navigator.pop(context, msg);
              },
            )
          ],
        ),
      ),
    );
  }
}
