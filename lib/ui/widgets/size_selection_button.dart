import 'package:flutter/material.dart';

class SizeSelectionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback tap;
  final Color borderColor;
  const SizeSelectionButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.tap,
      required this.textColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: tap,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 19),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            this.text,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ));
  }
}
