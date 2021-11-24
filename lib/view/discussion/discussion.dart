import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../utils/export_utilities.dart';

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
          return RoundContainer(
            child: Column(
              children: <Widget>[
                ElevatedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      sizedBoxHeight(16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomListTile(
                          leading: Image.asset(
                            Assets.follower,
                            scale: 1.8,
                          ),
                          title: const SubHeading1('Rohit Prajapati'),
                          subtitle: const SubHeading2(
                            '19/11/2021',
                            size: 14,
                            color: Colour.subtitleColor,
                          ),
                        ),
                      ),
                      const Divider(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: SubHeading2(
                          'Just Writing this caption for testing purpose and nothing else',
                          size: 15,
                        ),
                      ),
                      sizedBoxHeight(12),
                      Image.asset(
                        Assets.bar2,
                        height: screenHeight(context) * 0.26,
                        width: screenWidth(context),
                        fit: BoxFit.cover,
                      ),
                      sizedBoxHeight(12),
                      const _IconAndText(
                        iconAsset: Assets.likeFill,
                        text: '2,400',
                      ),
                      const Divider(height: 24),
                      Row(
                        children: <Widget>[
                          const _IconAndText(
                            iconAsset: Assets.like,
                            text: 'Like',
                            fontSize: 14,
                            iconScale: 2,
                          ),
                          sizedBoxWidth(16),
                          const _IconAndText(
                            iconAsset: Assets.comment,
                            text: 'Comment',
                            fontSize: 14,
                            iconScale: 2,
                          ),
                        ],
                      ),
                      sizedBoxHeight(16),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IconAndText extends StatelessWidget {
  const _IconAndText({
    Key? key,
    required this.iconAsset,
    required this.text,
    this.fontSize,
    this.iconScale,
  }) : super(key: key);

  final String iconAsset;
  final double? iconScale;
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          CustomImageWidget(
            image: iconAsset,
            scale: iconScale ?? 1.5,
          ),
          sizedBoxWidth(8),
          SubHeading2(
            text,
            size: fontSize ?? 12,
            color: Colour.subtitleColor,
          )
        ],
      ),
    );
  }
}
