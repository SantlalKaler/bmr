import 'package:flutter/foundation.dart';

class Constant {
  static printValue(value) {
    if (kDebugMode) {
      print(
          " \n<================================\n $value \n=========================>\n\n");
    }
  }
}
