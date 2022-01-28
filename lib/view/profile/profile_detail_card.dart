part of 'profile.dart';

class _ProfileDetailCard extends StatelessWidget {
  const _ProfileDetailCard(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.image})
      : super(key: key);

  final String name;
  final String email;
  final String phone;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: screenHeight(context),
      child: Stack(
        children: <Widget>[
          ElevatedContainer(
            radius: 14,
            width: screenWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                sizedBoxHeight(4),
                SubHeading1(name, size: 20),
                if (email.isNotEmpty) sizedBoxHeight(4),
                if (email.isNotEmpty)
                  SubHeading2(
                    email,
                    color: Colour.subtitleColor,
                  ),
                sizedBoxHeight(4),
                SubHeading2(
                  phone,
                  color: Colour.subtitleColor,
                ),
                // sizedBoxHeight(4),
                // Points(
                //   points: 2000,
                //   onTap: () => pushNamed(
                //     context,
                //     Routes.pointEarned,
                //   ),
                // ),
                sizedBoxHeight(10)
              ],
            ),
          ),
          if (image.isEmpty)
            const Align(
              alignment: Alignment(0, -2.2),
              child: CircleAvatar(
                backgroundColor: Colour.white,
                radius: 50,
                backgroundImage: AssetImage(Assets.profile),
              ),
            )
          else
            Align(
              alignment: const Alignment(0, -2.2),
              child: CircleAvatar(
                backgroundColor: Colour.white,
                radius: 50,
                backgroundImage: NetworkImage(image),
              ),
            ),
        ],
      ),
    );
  }
}
