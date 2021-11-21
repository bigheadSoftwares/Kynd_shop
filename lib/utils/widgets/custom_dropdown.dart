import 'package:flutter/material.dart';

import '../export_utilites.dart';
import 'heading.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.choosenValue,
  }) : super(key: key);

  final List<String> items;
  final Function(String?) onChanged;
  final String? choosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colour.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Colour.white,
        ),
        underline: const SizedBox.shrink(),
        value: choosenValue,
        selectedItemBuilder: (BuildContext context) {
          return List<Widget>.generate(
            items.length,
            (int index) {
              return Container(
                alignment: Alignment.center,
                child: SubHeading1(
                  text: items[index],
                  size: 16,
                  color: Colour.white,
                ),
              );
            },
          );
        },
        items: List<DropdownMenuItem<String>>.generate(
          items.length,
          (int index) {
            return DropdownMenuItem<String>(
              value: items[index],
              child: SubHeading1(
                text: items[index],
                size: 16,
                color: Colour.black,
              ),
            );
          },
        ),
        onChanged: onChanged,
      ),
    );
  }
}
