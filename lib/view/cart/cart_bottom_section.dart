part of 'cart.dart';

class _CartBottomSection extends StatefulWidget {
  const _CartBottomSection({
    Key? key,
  }) : super(key: key);

  @override
  State<_CartBottomSection> createState() => _CartBottomSectionState();
}

class _CartBottomSectionState extends State<_CartBottomSection> {
  List<AddressDatum> list = <AddressDatum>[];
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
            child: BlocConsumer<AddressCubit, AddressState>(
              listener: (BuildContext context, AddressState state) {
                if (state is AddressLoaded) {
                  setState(() {
                    list = context.read<AddressCubit>().defaultAddress;
                  });
                  show(list);
                }
              },
              builder: (BuildContext context, AddressState state) {
                return state is AddressLoaded
                    ? list.isEmpty
                        ? const SizedBox()
                        : CustomListTile(
                            leading: const CustomImageWidget(
                              image: Assets.pin2,
                              scale: 2,
                            ),
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child: SubHeading2(
                                    '${context.read<AddressCubit>().defaultAddress[0].username}',
                                    size: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    push(context, const CartAddress());
                                  },
                                  child: const SubHeading2(
                                    'CHANGE',
                                    color: Colour.greenishBlue,
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            subtitle: SubHeading2(
                              '${context.read<AddressCubit>().defaultAddress[0].address} ${context.read<AddressCubit>().defaultAddress[0].city}, ${context.read<AddressCubit>().defaultAddress[0].country} ${context.read<AddressCubit>().defaultAddress[0].postalCode}',
                              color: Colour.lightGrey.withOpacity(0.8),
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                    : const SizedBox.shrink();
              },
            ),
          ),
          sizedBoxHeight(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: CustomPrimaryButton(
              title: 'CONTINUE',
              onTap: () {
                pushNamed(context, Routes.payment).then((dynamic value) {
                  context.read<CartDetailsCubit>().getCartDetails();
                  context.read<CartSummaryCubit>().getCartSummary();
                  BlocProvider.of<AddressCubit>(context).getMyAddresses();
                });
              },
            ),
          ),
          sizedBoxHeight(10),
        ],
      ),
    );
  }
}
