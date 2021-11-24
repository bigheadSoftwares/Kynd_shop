part of 'profile.dart';

class _ProfileDetailCard extends StatelessWidget {
  const _ProfileDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: screenHeight(context),
      child: Stack(
        children: <Widget>[
          ElevatedContainer(
            radius: 14,
            width: screenWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SubHeading1('Rohit Prajapati', size: 20),
                sizedBoxHeight(4),
                const SubHeading2(
                  'RohitPrajapati@gmail.com',
                  color: Colour.subtitleColor,
                ),
                sizedBoxHeight(4),
                const SubHeading2(
                  '+91 9599923968',
                  color: Colour.subtitleColor,
                ),
                sizedBoxHeight(4),
                Points(
                  points: 2000,
                  onTap: () => pushNamed(
                    context,
                    Routes.pointEarned,
                  ),
                ),
                sizedBoxHeight(10)
              ],
            ),
          ),
          const Align(
            alignment: Alignment(0, -2.2),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.profile),
            ),
          ),
        ],
      ),
    );
  }
}
