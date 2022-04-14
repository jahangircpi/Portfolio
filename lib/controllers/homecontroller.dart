import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  int currentIndex = 0;
  bool onhover = false;
  int? hoverindex;

  gethoverboolean({values, hoverCurrentIndex}) {
    onhover = values;
    hoverindex = hoverCurrentIndex;
    notifyListeners();
  }

  getCurrentIndex({int? inde}) {
    currentIndex = inde!;
    notifyListeners();
  }
}
