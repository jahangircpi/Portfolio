import 'package:flutter/foundation.dart';
import '../screens/homepage/components/projectlists.dart';

class ProjectContraoller extends ChangeNotifier {
  bool showMore = false;
  int totalSize = 3;
  bool onhover = false;
  int? hoverIndex = 0;
  updatethelists() {
    showMore = !showMore;

    if (showMore == false) {
      totalSize = 3;
    } else if (showMore == true) {
      totalSize = ourapplists.length;
    }

    notifyListeners();
  }

  gethoverbooleancategory({values, hoverCurrentIndex}) {
    onhover = values;
    hoverIndex = hoverCurrentIndex;
    notifyListeners();
  }
}
