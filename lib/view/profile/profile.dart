import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/points_earned/points_earned_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../data/user/user_repository.dart';
import '../../logic/user/user_cubit.dart';

import '../../utils/export_utilities.dart';

part 'base_card.dart';
part 'profile_list_tile.dart';
part 'profile_detail_card.dart';
part 'edit_profile.dart';
part 'point_earned.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().reset();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<UserCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, UserState state) {
        return Scaffold(
          backgroundColor: Colour.blue,
          appBar: appBar(
            context,
            title: 'My Profile',
            elevation: 0,
            actions: <Widget>[
              if (state is UserSuccess)
                GestureDetector(
                  onTap: () {
                    push(
                      context,
                      EditProfile(user: state.user),
                    );
                  },
                  child: Image.asset(
                    Assets.editUser,
                    height: 30,
                    width: 30,
                  ),
                ),
              sizedBoxWidth(12),
            ],
          ),
          body: state is UserSuccess
              ? Stack(
                  children: <Widget>[
                    const _BaseCard(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: <Widget>[
                          sizedBoxHeight(screenHeight(context) * 0.1),
                          _ProfileDetailCard(
                            name: state.user.name,
                            email: state.user.email ?? '',
                            phone: state.user.phone,
                          ),
                          sizedBoxHeight(20),
                          _ProfileListTile(
                            title: 'Name',
                            subtitle: state.user.name,
                            image: Assets.person,
                          ),
                          sizedBoxHeight(20),
                          _ProfileListTile(
                            title: 'Email',
                            subtitle:
                                state.user.email ?? 'Please update your email',
                            image: Assets.email,
                          ),
                          sizedBoxHeight(20),
                          _ProfileListTile(
                            title: 'Mobile No.',
                            subtitle: state.user.phone,
                            image: Assets.mobileNumber,
                          ),
                          sizedBoxHeight(20),
                          _ProfileListTile(
                            title: 'Date of Birth',
                            subtitle:
                                state.user.dob ?? 'Please update your DOB',
                            image: Assets.dob,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : state is UserFailure
                  ? SubHeading2(state.failure.message)
                  : const Center(
                      child: LoadingIndicator(color: Colour.white),
                    ),
        );
      },
    );
  }
}
