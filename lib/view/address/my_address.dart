import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/add_address_model.dart';
import '../../logic/address/create_address_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../logic/address/address_cubit.dart';
import '../../logic/location/location_cubit.dart';
import '../../utils/export_utilities.dart';

part 'add_address.dart';
part 'save_as.dart';
part 'add_address_text_field.dart';
part 'map.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddressCubit>(context).getMyAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.lightGreyishBlue,
      appBar: appBar(
        context,
        title: 'My Address',
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
                  leading: const _AddressIcon(),
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
