import 'dart:collection';

import 'package:ecommerce_app/models/image_model.dart';
import 'package:flutter/material.dart';

class FavoriteNotifier extends ChangeNotifier {
  List<DataModel> dataList = [];
  List<bool> isFavoriteList = List<bool>.filled(imageList.length, false);
  List<int> indexes = [];
  void addCloth(DataModel cloth) {
    if (!dataList.contains(cloth)) {
      this.dataList.add(cloth);
      notifyListeners();
    }
  }

  void removeCloth(DataModel cloth) {
    this.dataList.remove(cloth);
    notifyListeners();
  }

  void favoriteChanged(int index) {
    isFavoriteList[index] = !isFavoriteList[index];
    if (!isFavoriteList[index]) {
      removeCloth(imageList[index]);
      indexes.remove(index);
    } else {
      addCloth(imageList[index]);
      indexes.add(index);
    }
  }
}
