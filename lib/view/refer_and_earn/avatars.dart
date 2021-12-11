part of 'refer_and_earn.dart';

class _Avatars extends StatelessWidget {
  const _Avatars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(Assets.profile),
          backgroundColor: Colour.transparent,
        ),
        sizedBoxWidth(screenWidth(context) * 0.05),
        const CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(Assets.profile1),
          backgroundColor: Colour.transparent,
        ),
        sizedBoxWidth(screenWidth(context) * 0.05),
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(Assets.profile2),
          backgroundColor: Colour.transparent,
        ),
      ],
    );
  }
}
