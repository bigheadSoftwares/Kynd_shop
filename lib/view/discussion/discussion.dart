import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../utils/export_utilities.dart';

part 'discussion_card.dart';
part 'icon_and_text.dart';
part 'discussion_details.dart';

class Discussion extends StatelessWidget {
  const Discussion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(
        context,
        title: 'Discussion',
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomImageWidget(
              image: Assets.search1,
              color: Colour.white,
            ),
          ),
          sizedBoxWidth(8),
        ],
      ),
      body: ListView.separated(
        itemCount: 3,
        padding: const EdgeInsets.symmetric(vertical: 20),
        separatorBuilder: (BuildContext context, int index) =>
            sizedBoxHeight(20),
        itemBuilder: (BuildContext context, int index) {
          return const _DiscussionCard();
        },
      ),
    );
  }
}
