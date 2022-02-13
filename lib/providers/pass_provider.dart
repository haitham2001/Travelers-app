import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier
{
  IconData suffix = Icons.visibility_outlined;
  bool isPass = true;

  void ChangePassVisibility ()
  {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    notifyListeners();
  }
}
