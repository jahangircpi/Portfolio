import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  int currentIndex = 0;

  getCurrentIndex({int? inde}) {
    currentIndex = inde!;
    notifyListeners();
  }
}
