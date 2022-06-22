import 'package:flutter/cupertino.dart';

class SelectionStateNotifier extends ChangeNotifier {
  List<bool> selected = [false, false, false, false];
  void filterSelected(int index) {
    for (int i = 0; i < selected.length; i++) {
      if (index == i) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
    notifyListeners();
  }
}
