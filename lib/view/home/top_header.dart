part of 'home.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  void initState() {
    super.initState();
    context.read<UserStatusCubit>().userStatus();
    context.read<AddressCubit>().getMyAddresses();
  }

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
              if (Constants.isLoggedIn)
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const CustomImageWidget(
                      image: Assets.menu,
                      scale: 1.8,
                    ),
                  ),
                ),
              if (!Constants.isLoggedIn)
                IconButton(
                  onPressed: () {
                    pushNamedAndRemoveUntil(
                        context, Routes.ageConfirmationScreen);
                  },
                  icon: const Icon(
                    Icons.login,
                    color: Colour.white,
                  ),
                ),
              const Spacer(),
              InkWell(
                onTap: () => Constants.isLoggedIn
                    ? pushNamed(context, Routes.discussion)
                    : showToast('Please login first'),
                child: const CustomImageWidget(
                  image: Assets.discussion,
                  scale: 1.8,
                ),
              ),
              sizedBoxWidth(18),
              InkWell(
                onTap: () => Constants.isLoggedIn
                    ? () {}
                    : showToast('Please login first'),
                child: const CustomImageWidget(
                  image: Assets.notification,
                  scale: 1.8,
                ),
              ),
              sizedBoxWidth(18),
              if (Constants.isLoggedIn) const _CoinContainer(),
            ],
          ),
          sizedBoxHeight(15),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (BuildContext context, AddressState state) {
              if (state is AddressLoaded) {
                AddressDatum address =
                    context.read<AddressCubit>().defaultAddress!.isNotEmpty
                        ? context.read<AddressCubit>().defaultAddress![0]
                        : const AddressDatum(address: '', city: '');
                return Row(
                  children: <Widget>[
                    if (context.read<AddressCubit>().defaultAddress!.isNotEmpty)
                      const CustomImageWidget(
                        image: Assets.pin1,
                        scale: 1.8,
                      ),
                    sizedBoxWidth(5),
                    Flexible(
                      child: Text(
                        '${address.address} ${address.city}',
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colour.white,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
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
    return BlocBuilder<UserStatusCubit, UserStatusState>(
      builder: (BuildContext context, UserStatusState state) {
        if (state is UserStatusLoaded) {
          return RoundContainer(
            onTap: () => pushNamed(
              context,
              Routes.pointEarned,
            ),
            radius: 20,
            hPadding: 3,
            vPadding: 3,
            borderWidth: 1.4,
            borderColor: Colour.white,
            child: Row(
              children: <Widget>[
                const CustomImageWidget(
                  image: Assets.coin,
                  scale: 1.8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SubHeading2(
                    '${state.userData.data?.charity ?? 0}',
                    size: 10,
                    fontWeight: FontWeight.bold,
                    color: Colour.white,
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
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
      readOnly: true,
      onTap: () {
        pushNamed(context, Routes.search);
      },
      controller: _textEditingController,
      inputTextStyle: const TextStyle(
        color: Colour.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colour.fillColor,
      borderColor: Colour.transparent,
      enabledBorderColor: Colour.transparent,
      disabledBorderColor: Colour.transparent,
      hintText: 'Type something...',
      hintStyle: TextStyle(
          color: Colour.white.withOpacity(0.7),
          fontSize: 16,
          fontWeight: FontWeight.w400),
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
