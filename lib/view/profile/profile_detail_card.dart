part of 'profile.dart';

class _ProfileDetailCard extends StatelessWidget {
  const _ProfileDetailCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  final String name;
  final String email;
  final String phone;
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
                SubHeading1(name, size: 20),
                sizedBoxHeight(4),
                SubHeading2(
                  email,
                  color: Colour.subtitleColor,
                ),
                sizedBoxHeight(4),
                SubHeading2(
                  phone,
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
