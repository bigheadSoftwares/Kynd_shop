part of 'profile.dart';

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      color: Colour.white,
      vPadding: 12,
      hPadding: 8,
      child: ListTile(
        title: SubHeading1(
          title,
          color: Colour.subtitleColor,
        ),
        subtitle: SubHeading2(
          subtitle,
          fontWeight: FontWeight.w500,
        ),
        dense: true,
        horizontalTitleGap: 4,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        leading: Image.asset(
          image,
          height: 22,
          width: 22,
          color: Colors.black,
        ),
      ),
    ).outerNeumorphism();
  }
}
