import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/logic/address/make_default_cubit.dart';
import '../../logic/address/address_cubit.dart';
import '../../utils/export_utilities.dart';

class CartAddress extends StatefulWidget {
  const CartAddress({Key? key}) : super(key: key);

  @override
  State<CartAddress> createState() => _CartAddressState();
}

class _CartAddressState extends State<CartAddress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.lightGreyishBlue,
      appBar: appBar(
        context,
        title: 'Address',
      ),
      body: ListView(
        children: <Widget>[
          const _Addresses(),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: CustomButton(
              radius: 8,
              width: screenWidth(context) * 0.9,
              backgroundColor: Colour.greyishBlue,
              padding: const EdgeInsets.symmetric(vertical: 15),
              onTap: () {
                pushNamed(context, Routes.addAddress).then(
                  (value) =>
                      BlocProvider.of<AddressCubit>(context).getMyAddresses(),
                );
              },
              child: const SubHeading1(
                'ADD ADDRESS',
                color: Colour.greenishBlue,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Addresses extends StatelessWidget {
  const _Addresses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (BuildContext context, AddressState state) {
        if (state is AddressInitial) {
          return ShimmerBox(
            height: 250,
            width: screenWidth(context) * 0.8,
            itemCount: 3,
          );
        } else if (state is AddressLoading) {
          return const LinearProgressIndicator();
        } else if (state is AddressLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            shrinkWrap: true,
            primary: false,
            itemCount: state.myAddressesModel.data?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) =>
                sizedBoxHeight(20),
            itemBuilder: (BuildContext context, int index) {
              return RoundContainer(
                hPadding: 16,
                vPadding: 20,
                color: Colour.white,
                child: CustomListTile(
                  leading: state.myAddressesModel.data?[index].setDefault == 1
                      ? const RoundContainer(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: CustomImageWidget(
                            image: Assets.radio,
                            color: Colour.greenishBlue,
                            scale: 1.4,
                          ),
                        )
                      : BlocListener<MakeDefaultCubit, MakeDefaultState>(
                          listener:
                              (BuildContext context, MakeDefaultState state) {
                            if (state is MakeDefaultLoaded) {
                              context.read<AddressCubit>().getMyAddresses();
                            }
                          },
                          child: RoundContainer(
                              onTap: () {
                                context.read<MakeDefaultCubit>().makeDefault(
                                    state.myAddressesModel.data![index].id!);
                              },
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: const CustomImageWidget(
                                image: Assets.unradio,
                                color: Colour.greenishBlue,
                                scale: 1.4,
                              )),
                        ),
                  title: SubHeading1(
                      state.myAddressesModel.data?[index].nameTag ?? 'home'),
                  spaceBetweenTitleAndSubtitle: 4,
                  subtitle: SubHeading2(
                    '+91 ${state.myAddressesModel.data?[index].phone}\n${state.myAddressesModel.data?[index].address} ${state.myAddressesModel.data?[index].city}, ${state.myAddressesModel.data?[index].country} ${state.myAddressesModel.data?[index].postalCode}',
                    maxLines: 3,
                    //TODO Uncomment this below line
                    // overflow: TextOverflow.ellipsis,
                    color: Colour.subtitleColor,
                  ),
                  description:
                      state.myAddressesModel.data?[index].setDefault == 1
                          ? const RoundContainer(
                              vMargin: 10,
                              hPadding: 20,
                              vPadding: 5,
                              color: Colour.greyishBlue,
                              child: SubHeading1(
                                'Recommended',
                                color: Colour.greenishBlue,
                                size: 12,
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
              ).outerNeumorphism();
            },
          );
        } else {
          return Center(
              child: SubHeading2((state as AddressFailure).failure.message));
        }
      },
    );
  }
}

class _AddressIcon extends StatelessWidget {
  const _AddressIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      widthFactor: 1.1,
      heightFactor: 2.2,
      child: ElevatedContainer(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        radius: 16,
        color: Colour.white,
        child: CustomImageWidget(
          image: Assets.addressHome,
          color: Colour.greenishBlue,
          scale: 1.4,
        ),
      ),
    );
  }
}
