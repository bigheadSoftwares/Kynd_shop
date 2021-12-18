part of 'cart.dart';

class _PromoContainer extends StatefulWidget {
  const _PromoContainer({
    Key? key,
  }) : super(key: key);
  @override
  State<_PromoContainer> createState() => _PromoContainerState();
}

class _PromoContainerState extends State<_PromoContainer> {
  TextEditingController textEditingController = TextEditingController();
  bool isCoupnApplied = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: DottedBorder(
        color: Colour.lightGrey.withOpacity(0.5),
        dashPattern: const <double>[5, 5],
        child: Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                controller: textEditingController,
              ),
            ),
            const RoundContainer(
              height: 22,
              hPadding: 20,
              vPadding: 0,
              radius: 6,
              color: Colour.greenishBlue,
              child: SubHeading2(
                'Apply',
                size: 12,
                fontWeight: FontWeight.bold,
                color: Colour.white,
              ),
            ),
            sizedBoxWidth(15)
          ],
        ),
      ),
    );
  }
}
