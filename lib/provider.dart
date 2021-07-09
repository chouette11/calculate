import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculate1 extends ChangeNotifier {
  String result = "";
  String rigidResult = "";
  bool check = false;

  calculation(String number) {
    if (number != "*=" && number != "!") {
      check == false ? result += number : rigidResult += number;
      notifyListeners();
    }
    if (number == "C") {
      check == false ? result = "" : rigidResult = "";
      notifyListeners();
    }
    if (number == "*=") {
      result = (double.parse(result) * int.parse(rigidResult)).toStringAsFixed(2);
      notifyListeners();
    }
    if (number == "!") {
      if (check == false) {
        check = true;
        notifyListeners();
      } else {
        check = false;
        notifyListeners();
      }
    }
  }
}
