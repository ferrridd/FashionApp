import 'dart:collection';

import 'package:ecommerce_app/models/image_model.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  List<DataModel> cartList = [];
  List<int> countList = [];
  double totalPrice = 0;

  void addCloth(DataModel data) {
    if (!cartList.contains(data)) {
      this.cartList.add(data);
      countList.add(1);
    } else {
      countList[cartList.indexOf(data)]++;
    }
    totalPriceCalc();
    notifyListeners();
  }

  void removeOneCloth(DataModel data) {
    if (countList[cartList.indexOf(data)] >= 2) {
      countList[cartList.indexOf(data)]--;
    } else {
      removeClothCompletely(data);
    }
    totalPriceCalc();
    notifyListeners();
  }

  void removeClothCompletely(DataModel data) {
    countList.remove([cartList.indexOf(data)]);
    this.cartList.remove(data);
    totalPriceCalc();
    notifyListeners();
  }

  onSizeSelected(DataModel data, String size, int index) {
    data.size = size;
    for (int i = 0; i < data.sizeList.length; i++) {
      if (i == index) {
        data.sizeList[i] = true;
      } else {
        data.sizeList[i] = false;
      }
    }
    totalPriceCalc();
    notifyListeners();
  }

  onColorSelected(DataModel data, Color color, int index) {
    data.color = color;
    for (int i = 0; i < data.colorList.length; i++) {
      if (i == index) {
        data.colorList[i] = true;
      } else {
        data.colorList[i] = false;
      }
    }
    totalPriceCalc();
    notifyListeners();
  }

  totalPriceCalc() {
    totalPrice = 0;
    for (int i = 0; i < cartList.length; i++) {
      totalPrice += cartList[i].price * countList[i];
    }
    int totalInt = totalPrice.round();
    this.totalPrice = totalInt.toDouble();
  }
}
