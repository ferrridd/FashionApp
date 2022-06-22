import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback tap;
  const SelectionButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.tap,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: tap,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(color: backgroundColor),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            this.text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
