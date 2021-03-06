import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/user_status/user_status_cubit.dart';
import 'package:share/share.dart';
import '../../utils/export_utilities.dart';

part 'sidebar_items.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.75,
      color: Colour.blue,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            sizedBoxHeight(30),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: CustomListTile(
                leading: CircleAvatar(
                  backgroundColor: Colour.white,
                  radius: 45,
                  backgroundImage: (Constants.userModel?.avatarOriginal ==
                                  null ||
                              Constants.userModel!.avatarOriginal!.isEmpty
                          ? const AssetImage(Assets.profile)
                          : NetworkImage(Constants.userModel!.avatarOriginal!))
                      as ImageProvider,
                ),
                spaceBetweenLeadingAndTitle: 16,
                title: BlocBuilder<UserStatusCubit, UserStatusState>(
                  builder: (BuildContext context, UserStatusState state) {
                    if (state is UserStatusLoaded) {
                      return SubHeading1(
                        state.userData.data?.userDetails?.name ?? '',
                        color: Colour.white,
                      );
                    } else {
                      return const SubHeading1(
                        'Test',
                        color: Colour.white,
                      );
                    }
                  },
                ),
                subtitle: InkWell(
                  onTap: () {
                    pop(context);
                    pushNamed(context, Routes.profile);
                  },
                  child: const SubHeading2(
                    'View Profile',
                    color: Colour.white,
                  ),
                ),
              ),
            ),
            sizedBoxHeight(30),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 20),
                itemCount: _sidebarItems.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    sizedBoxHeight(30),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => _manageSidebarNavigation(
                      context,
                      _sidebarItems[index],
                    ),
                    child: CustomListTile(
                      leading: CustomImageWidget(
                        image: _sidebarItems[index].asset,
                        scale: 1.8,
                      ),
                      spaceBetweenLeadingAndTitle: 20,
                      title: SubHeading1(
                        _sidebarItems[index].name,
                        color: Colour.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _manageSidebarNavigation(
      BuildContext context, SidebarItems sidebarItem) {
    pop(context);
    if (sidebarItem.name.toLowerCase() == 'home') {
      return;
    } else if (sidebarItem.name.toLowerCase() == 'logout') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
            title: 'Are you sure ?',
            subtitle: 'Please Confirm to Logout',
            onConfirm: () async {
              Constants.isLoggedIn = false;
              await deleteLocalKey(Constants.loginModelKey);
              await deleteLocalKey(Constants.loginStatus);
              pushNamedAndRemoveUntil(
                context,
                Routes.ageConfirmationScreen,
              );
            },
          );
        },
      );
    } else if (sidebarItem.name.toLowerCase() == 'login') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
            title: 'Are you sure ?',
            subtitle: 'Please Confirm to Login',
            onConfirm: () async {
              await deleteLocalKey(Constants.skippedStatus);
              pushNamedAndRemoveUntil(
                context,
                Routes.ageConfirmationScreen,
              );
            },
          );
        },
      );
    } else if (sidebarItem.name.toLowerCase() == 'share app') {
      Share.share(
        'https://play.google.com/store/apps/details?id=com.example.kynd_shop',
      );
    } else {
      pushNamed(context, sidebarItem.route);
    }
  }
}
