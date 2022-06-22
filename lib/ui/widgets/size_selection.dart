import 'package:ecommerce_app/models/cart_notifier.dart';
import 'package:ecommerce_app/models/image_model.dart';
import 'package:ecommerce_app/ui/widgets/color_selection_button.dart';
import 'package:ecommerce_app/ui/widgets/size_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeSelection extends StatelessWidget {
  final DataModel data;
  final int index;
  const SizeSelection({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Select Size",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    SizeSelectionButton(
                  tap: () {
                    CartNotifier.onSizeSelected(data, "S", 0);
                    debugPrint(data.sizeList.toString());
                  },
                  backgroundColor:
                      data.sizeList[0] ? Colors.orange : Colors.white,
                  borderColor: data.sizeList[0] ? Colors.orange : Colors.grey,
                  text: "S",
                  textColor: data.sizeList[0] ? Colors.white : Colors.black,
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    SizeSelectionButton(
                  tap: () {
                    CartNotifier.onSizeSelected(data, "M", 1);
                    debugPrint(data.sizeList.toString());
                  },
                  backgroundColor:
                      data.sizeList[1] ? Colors.orange : Colors.white,
                  borderColor: data.sizeList[1] ? Colors.orange : Colors.grey,
                  text: "M",
                  textColor: data.sizeList[1] ? Colors.white : Colors.black,
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    SizeSelectionButton(
                  tap: () {
                    CartNotifier.onSizeSelected(data, "L", 2);
                    debugPrint(data.sizeList.toString());
                  },
                  backgroundColor:
                      data.sizeList[2] ? Colors.orange : Colors.white,
                  borderColor: data.sizeList[2] ? Colors.orange : Colors.grey,
                  text: "L",
                  textColor: data.sizeList[2] ? Colors.white : Colors.black,
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    SizeSelectionButton(
                  tap: () {
                    CartNotifier.onSizeSelected(data, "XL", 3);
                    debugPrint(data.sizeList.toString());
                  },
                  backgroundColor:
                      data.sizeList[3] ? Colors.orange : Colors.white,
                  borderColor: data.sizeList[3] ? Colors.orange : Colors.grey,
                  text: "XL",
                  textColor: data.sizeList[3] ? Colors.white : Colors.black,
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    SizeSelectionButton(
                  tap: () {
                    CartNotifier.onSizeSelected(data, "XXL", 4);
                    debugPrint(data.sizeList.toString());
                  },
                  backgroundColor:
                      data.sizeList[4] ? Colors.orange : Colors.white,
                  borderColor: data.sizeList[4] ? Colors.orange : Colors.grey,
                  text: "XXL",
                  textColor: data.sizeList[4] ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(data, Colors.white, 0);
                  },
                  backgroundColor: Colors.white,
                  borderColor: data.colorList[0] ? Colors.orange : Colors.grey,
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(195, 176, 179, 0.7), 1);
                  },
                  backgroundColor: Color.fromRGBO(195, 176, 179, 0.7),
                  borderColor: data.colorList[1]
                      ? Colors.orange
                      : Color.fromRGBO(195, 176, 179, 0.7),
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(214, 225, 255, 0.7), 2);
                  },
                  backgroundColor: Color.fromRGBO(214, 225, 255, 0.7),
                  borderColor: data.colorList[2]
                      ? Colors.orange
                      : Color.fromRGBO(214, 225, 255, 0.7),
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(245, 214, 255, 0.7), 3);
                  },
                  backgroundColor: Color.fromRGBO(245, 214, 255, 0.7),
                  borderColor: data.colorList[3]
                      ? Colors.orange
                      : Color.fromRGBO(245, 214, 255, 0.7),
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(212, 238, 235, 0.7), 4);
                  },
                  backgroundColor: Color.fromRGBO(212, 238, 235, 0.7),
                  borderColor: data.colorList[4]
                      ? Colors.orange
                      : Color.fromRGBO(212, 238, 235, 0.7),
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(221, 217, 208, 0.7), 5);
                  },
                  backgroundColor: Color.fromRGBO(221, 217, 208, 0.7),
                  borderColor: data.colorList[5]
                      ? Colors.orange
                      : Color.fromRGBO(221, 217, 208, 0.7),
                ),
              ),
              Consumer<CartNotifier>(
                builder: (BuildContext context, CartNotifier, Widget? child) =>
                    ColorSelectionButton(
                  tap: () {
                    CartNotifier.onColorSelected(
                        data, Color.fromRGBO(255, 213, 223, 0.7), 6);
                  },
                  backgroundColor: Color.fromRGBO(255, 213, 223, 0.7),
                  borderColor: data.colorList[6]
                      ? Colors.orange
                      : Color.fromRGBO(255, 213, 223, 0.7),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
