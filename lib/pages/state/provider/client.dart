

import 'package:flutter/foundation.dart';

class Client extends ChangeNotifier {
  String name;

  Client(this.name);

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }
}
