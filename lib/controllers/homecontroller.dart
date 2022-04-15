import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  int currentIndex = 0;
  bool onhoverforsocialitems = false;
  bool onhovercategory = false;
  int? hoverindexforsocialitems;
  int? hoverindexcategory = 0;
  bool texthover = false;
  getTextHover({bool? value}) {
    texthover = value!;
    notifyListeners();
  }

  gethoverbooleancategory({values, hoverCurrentIndex}) {
    onhovercategory = values;
    hoverindexcategory = hoverCurrentIndex;
    notifyListeners();
  }

  gethoverbooleanforsocial({values, hoverCurrentIndex}) {
    onhoverforsocialitems = values;
    hoverindexforsocialitems = hoverCurrentIndex;
    notifyListeners();
  }

  getCurrentIndex({int? inde}) {
    currentIndex = inde!;
    notifyListeners();
  }
}
