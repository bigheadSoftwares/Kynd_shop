part of 'cart.dart';

class _CartBottomSection extends StatelessWidget {
  const _CartBottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colour.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RoundContainer(
            hPadding: 20,
            vPadding: 5,
            radius: 0,
            color: Colour.greenishBlue.withOpacity(0.15),
            child: CustomListTile(
              leading: const CustomImageWidget(
                image: Assets.pin2,
                scale: 2,
              ),
              title: Row(
                children: const <Widget>[
                  Expanded(
                    child: SubHeading2(
                      'Deliver to: Shehnawaz',
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SubHeading2(
                    'CHANGE',
                    color: Colour.greenishBlue,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              subtitle: SubHeading2(
                'C - 232/1, Rohini, New Delhi, India',
                color: Colour.lightGrey.withOpacity(0.8),
                size: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: RoundContainer(
              onTap: () {},
              hPadding: 10,
              vPadding: 10,
              radius: 30,
              color: Colour.greenishBlue,
              width: double.infinity,
              child: const Center(
                child: SubHeading1(
                  'CONTINUE',
                  color: Colour.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
