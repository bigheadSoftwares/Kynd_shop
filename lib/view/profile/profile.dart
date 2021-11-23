import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../utils/export_utilities.dart';

part 'base_card.dart';
part 'profile_list_tile.dart';
part 'profile_detail_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.blue,
      appBar: appBar(
        context,
        title: 'My Profile',
        elevation: 0,
        actions: <Widget>[
          Image.asset(
            Assets.editUser,
            height: 30,
            width: 30,
          ),
          sizedBoxWidth(12),
        ],
      ),
      body: Stack(
        children: <Widget>[
          const _BaseCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                sizedBoxHeight(screenHeight(context) * 0.1),
                const _ProfileDetailCard(),
                sizedBoxHeight(20),
                const _ProfileListTile(
                  title: 'Name',
                  subtitle: 'Rohit Prajapati',
                  image: Assets.person,
                ),
                sizedBoxHeight(20),
                const _ProfileListTile(
                  title: 'Email',
                  subtitle: 'rohitprajapati@gmail.com',
                  image: Assets.email,
                ),
                sizedBoxHeight(20),
                const _ProfileListTile(
                  title: 'Mobile No.',
                  subtitle: '+91 9599923968',
                  image: Assets.mobileNumber,
                ),
                sizedBoxHeight(20),
                const _ProfileListTile(
                  title: 'Date of Birth',
                  subtitle: '06/06/1999',
                  image: Assets.dob,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
