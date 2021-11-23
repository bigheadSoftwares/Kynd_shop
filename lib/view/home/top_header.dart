part of 'home.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 50,
        bottom: 20,
        right: 20,
        left: 20,
      ),
      color: Colour.darkBlue,
      child: Column(
        children: <Widget>[
          sizedBoxHeight(20),
          Row(
            children: <Widget>[
              const CustomImageWidget(
                image: Assets.menu,
                scale: 1.8,
              ),
              const Spacer(),
              const CustomImageWidget(
                image: Assets.discussion,
                scale: 1.8,
              ),
              sizedBoxWidth(15),
              const CustomImageWidget(
                image: Assets.notification,
                scale: 1.8,
              ),
              sizedBoxWidth(15),
              const _CoinContainer(),
            ],
          ),
          sizedBoxHeight(15),
          Row(
            children: <Widget>[
              const CustomImageWidget(
                image: Assets.pin1,
                scale: 1.8,
              ),
              sizedBoxWidth(5),
              const SubHeading2(
                '204, kingstreet, malbourne - 235345',
                color: Colour.white,
                size: 12,
              )
            ],
          ),
          sizedBoxHeight(15),
          const SearchField()
        ],
      ),
    );
  }
}

class _CoinContainer extends StatelessWidget {
  const _CoinContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      radius: 20,
      hPadding: 3,
      vPadding: 3,
      borderColor: Colour.white,
      child: Row(
        children: const <Widget>[
          CustomImageWidget(
            image: Assets.coin,
            scale: 1.8,
          ),
          SubHeading2(
            '2000 Kynd Points',
            size: 8,
            color: Colour.white,
          )
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _textEditingController,
      filled: true,
      fillColor: Colour.white.withOpacity(0.1),
      borderColor: Colour.transparent,
      enabledBorderColor: Colour.transparent,
      disabledBorderColor: Colour.transparent,
      hintText: 'Type something...',
      hintStyle: TextStyle(
        color: Colour.white.withOpacity(0.5),
      ),
      prefixIcon: const Padding(
        padding: EdgeInsets.all(14.0),
        child: CustomImageWidget(
          image: Assets.search,
          scale: 5,
        ),
      ),
    );
  }
}
