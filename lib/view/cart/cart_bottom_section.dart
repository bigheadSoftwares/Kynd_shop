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
                    list = state.myAddressesModel.data!
                        .where(
                            (AddressDatum element) => element.setDefault == 1)
                        .toList();
                  });
                  show(list);
                  if (list.isEmpty) {
                    setState(() {
                      list.add(state.myAddressesModel.data![0]);
                    });
                  }
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
                                    '${list[0].address} ${list[0].city}, ${list[0].country} ${list[0].postalCode}',
                                    size: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SubHeading2(
                                  'CHANGE',
                                  color: Colour.greenishBlue,
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            subtitle: SubHeading2(
                              '${list[0].address} ${list[0].city}, ${list[0].country} ${list[0].postalCode}',
                              color: Colour.lightGrey.withOpacity(0.8),
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                    : const SizedBox();
              },
            ),
          ),
          sizedBoxHeight(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: CustomPrimaryButton(
              title: 'CONTINUE',
              onTap: () {
                pushNamed(context, Routes.payment);
              },
            ),
          ),
          sizedBoxHeight(10),
        ],
      ),
    );
  }
}
