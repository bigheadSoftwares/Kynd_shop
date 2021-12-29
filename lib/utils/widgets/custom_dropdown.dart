import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../export_utilities.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.chosenValue,
  }) : super(key: key);

  final List<String> items;
  final Function(String?) onChanged;
  final String? chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colour.offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Colour.black,
        ),
        underline: const SizedBox.shrink(),
        value: chosenValue,
        borderRadius: radius(10),
        isExpanded: true,
        menuMaxHeight: screenHeight(context) * 0.4,
        hint: const Align(
          alignment: Alignment.centerLeft,
          child: SubHeading2(
            'Enter tag',
            size: 16,
            color: Color(0xFFBEBECA),
          ),
        ),
        selectedItemBuilder: (BuildContext context) {
          return List<Widget>.generate(
            items.length,
            (int index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: SubHeading2(
                  items[index],
                  size: 16,
                  color: Colour.black,
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
              child: SubHeading2(
                items[index],
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
