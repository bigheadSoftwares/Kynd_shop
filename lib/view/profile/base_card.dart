part of 'profile.dart';


class _BaseCard extends StatelessWidget {
  const _BaseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight(context) * 0.7,
        width: screenWidth(context),
        decoration: const BoxDecoration(
          color: Colour.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}