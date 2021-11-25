part of 'profile.dart';

class PointEarned extends StatelessWidget {
  const PointEarned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Point Earned',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RoundContainer(
              color: Colour.greenishBlue,
              vPadding: 12,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    sizedBoxHeight(16),
                    const Heading1(
                      '2000',
                      color: Colour.white,
                      fontWeight: FontWeight.w500,
                    ),
                    const SubHeading2(
                      'Total Points Earned',
                      size: 14,
                      fontWeight: FontWeight.w500,
                      color: Colour.white,
                    ),
                    sizedBoxHeight(16),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(16),
            const Heading2(
              'Point History',
              size: 20,
            ),
            sizedBoxHeight(16),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 24,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return CustomListTile(
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(Assets.point),
                      backgroundColor: Colour.transparent,
                    ),
                    title: const SubHeading1('Signup Cashback'),
                    subtitle: const SubHeading2(
                      'On Nov 16th, 2021',
                      color: Colour.subtitleColor,
                      size: 14,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const <Widget>[
                        Heading2(
                          '+ 100',
                          color: Colour.parrotGreen,
                          size: 22,
                        ),
                        SubHeading2(
                          'Order id: #5689',
                          color: Colour.subtitleColor,
                          size: 12,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
