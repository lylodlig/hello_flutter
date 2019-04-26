import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RollingButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RollingState();
  }
}

class _RollingState extends State<RollingButton> {
  final _random = Random();

  List<int> _roll() {
    final roll1 = _random.nextInt(6) + 1;
    final roll2 = _random.nextInt(6) + 1;
    return [roll1, roll2];
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPress,
    );
  }

  void _onPress() {
    final rollResult=_roll();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Roll Result:(${rollResult[0]},${rollResult[1]})'),
          );
        });
  }
}
