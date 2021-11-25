part of 'discussion.dart';

class DiscussionDetails extends StatelessWidget {
  const DiscussionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(
        context,
        title: 'Comments',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[
          const _DiscussionCard(
            showComments: false,
          ),
          sizedBoxHeight(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Heading2(
              '3852 Comments',
              size: 18,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            separatorBuilder: (BuildContext context, int index) =>
                sizedBoxHeight(20),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colour.white,
                    radius: 24,
                    backgroundImage: AssetImage(Assets.profile),
                  ),
                  sizedBoxWidth(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colour.greyishBlue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: const CustomListTile(
                        title: SubHeading1(
                          'Vikas Kumar',
                          size: 16,
                        ),
                        subtitle: SubHeading2(
                          'Random comment just for testing purpose and nothing much. Please ignore it.',
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
