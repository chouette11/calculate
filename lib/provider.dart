import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculate1 extends ChangeNotifier {
  String result = "";
  String rigidResult = "";
  bool check = false;
  String results = "";
  String operator = "";

  calculation(String number) {
    if (number != "=" && number != "C" && number != "+" && number != "-" && number != "÷" && number != "×") {
      check == false ? result += number : rigidResult += number;
      notifyListeners();
    }
    if (number == "C") {
      check == false ? result = "" : rigidResult = "";
      operator = "";
      notifyListeners();
    }
    if (number == "+" || number == "-" || number == "÷" || number == "×") {
      results = result;
      result = "";
      operator = number;
      notifyListeners();
    }
    if (number == "=") {
      if (operator == "+"){
        result = (int.parse(result) + int.parse(results)).toString();
        operator = "";
        notifyListeners();
      } else if (operator == "-"){
        result = (int.parse(results) - int.parse(result)).toString();
        operator = "";
        notifyListeners();
      } else if (operator == "×"){
        result = (int.parse(result) * int.parse(results)).toString();
        operator = "";
        notifyListeners();
      } else if (operator == "÷"){
        result = (int.parse(results) / int.parse(result)).toString();
        operator = "";
        notifyListeners();
      }
    }
  }
}
