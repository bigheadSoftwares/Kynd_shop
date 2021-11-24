part of 'discussion.dart';

class _DiscussionCard extends StatelessWidget {
  const _DiscussionCard({
    Key? key,
    this.showComments = true,
  }) : super(key: key);

  final bool showComments;

  @override
  Widget build(BuildContext context) {
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
                    if (showComments)
                      GestureDetector(
                        onTap: () => push(
                          context,
                          const _DiscussionDetails(),
                        ),
                        child: const _IconAndText(
                          iconAsset: Assets.comment,
                          text: 'Comment',
                          fontSize: 14,
                          iconScale: 2,
                        ),
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
  }
}
