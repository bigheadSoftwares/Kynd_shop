import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/location/location_cubit.dart';
import '../../utils/export_utilities.dart';

part 'add_address.dart';
part 'save_as.dart';
part 'add_address_text_field.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.lightGreyishBlue,
      appBar: appBar(
        context,
        title: 'My Address',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) =>
            sizedBoxHeight(20),
        itemBuilder: (BuildContext context, int index) {
          return const RoundContainer(
            hPadding: 16,
            vPadding: 20,
            color: Colour.white,
            child: CustomListTile(
              leading: _AddressIcon(),
              title: SubHeading1('Home'),
              spaceBetweenTitleAndSubtitle: 4,
              subtitle: SubHeading2(
                '+91 9999999987\nC9/21 Sec-7 Rohini, New Delhi 110085',
                color: Colour.subtitleColor,
              ),
            ),
          ).outerNeumorphism();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        radius: 8,
        width: screenWidth(context) * 0.9,
        backgroundColor: Colour.greyishBlue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        onTap: () {
          pushNamed(context, Routes.addAddress);
        },
        child: const SubHeading1(
          'ADD ADDRESS',
          color: Colour.greenishBlue,
          size: 18,
        ),
      ),
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
