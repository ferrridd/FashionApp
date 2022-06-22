import 'package:ecommerce_app/models/selection_state_notifier.dart';
import 'package:ecommerce_app/ui/widgets/selection_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionRow extends StatefulWidget {
  const SelectionRow({Key? key}) : super(key: key);

  @override
  State<SelectionRow> createState() => _SelectionRowState();
}

class _SelectionRowState extends State<SelectionRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Consumer<SelectionStateNotifier>(
          builder:
              (BuildContext context, SelectionStateNotifier, Widget? child) =>
                  SelectionButton(
                      tap: (() {
                        SelectionStateNotifier.filterSelected(0);
                      }),
                      text: "All",
                      backgroundColor: SelectionStateNotifier.selected[0]
                          ? Colors.black
                          : Colors.white,
                      textColor: SelectionStateNotifier.selected[0]
                          ? Colors.white
                          : Colors.black),
        ),
        Consumer<SelectionStateNotifier>(
          builder:
              (BuildContext context, SelectionStateNotifier, Widget? child) =>
                  SelectionButton(
                      tap: (() {
                        SelectionStateNotifier.filterSelected(1);
                      }),
                      text: "Winter",
                      backgroundColor: SelectionStateNotifier.selected[1]
                          ? Colors.black
                          : Colors.white,
                      textColor: SelectionStateNotifier.selected[1]
                          ? Colors.white
                          : Colors.black),
        ),
        Consumer<SelectionStateNotifier>(
          builder:
              (BuildContext context, SelectionStateNotifier, Widget? child) =>
                  SelectionButton(
                      tap: (() {
                        SelectionStateNotifier.filterSelected(2);
                      }),
                      text: "Women",
                      backgroundColor: SelectionStateNotifier.selected[2]
                          ? Colors.black
                          : Colors.white,
                      textColor: SelectionStateNotifier.selected[2]
                          ? Colors.white
                          : Colors.black),
        ),
        Consumer<SelectionStateNotifier>(
          builder:
              (BuildContext context, SelectionStateNotifier, Widget? child) =>
                  SelectionButton(
                      tap: (() {
                        SelectionStateNotifier.filterSelected(3);
                      }),
                      text: "Eyewear",
                      backgroundColor: SelectionStateNotifier.selected[3]
                          ? Colors.black
                          : Colors.white,
                      textColor: SelectionStateNotifier.selected[3]
                          ? Colors.white
                          : Colors.black),
        ),
      ]),
    );
  }
}
