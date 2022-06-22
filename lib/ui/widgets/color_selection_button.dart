import 'package:flutter/material.dart';

class ColorSelectionButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback tap;
  final Color borderColor;
  const ColorSelectionButton(
      {Key? key,
      required this.backgroundColor,
      required this.tap,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: tap,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}
