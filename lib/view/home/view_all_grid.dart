import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

class ViewAllGrid extends StatelessWidget {
  const ViewAllGrid({
    Key? key,
    this.viewAllChild,
    this.title,
  }) : super(key: key);
  final Widget? viewAllChild;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Heading2(
          title ?? '',
          size: 18,
        ),
      ),
      body: viewAllChild ?? Container(),
    );
  }
}
