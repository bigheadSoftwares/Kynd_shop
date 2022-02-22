import 'package:dotted_border/dotted_border.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/user_status/user_status_cubit.dart';
import 'package:share/share.dart';
import '../../utils/export_utilities.dart';

part 'avatars.dart';
part 'share_with_friends.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  late String? _shareText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Refer & Earn',
      ),
      body: BlocBuilder<UserStatusCubit, UserStatusState>(
        builder: (BuildContext context, UserStatusState state) {
          if (state is UserStatusLoaded) {
            _shareText =
                'Use ${state.userData.data?.referralCode ?? ''} to get 100 points https://play.google.com/store/apps/details?id=com.app.Symphonian';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  sizedBoxHeight(screenHeight(context) * 0.04),
                  const _Avatars(),
                  sizedBoxHeight(screenHeight(context) * 0.02),
                  const Text.rich(
                    TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Friends Get ',
                        style: TextStyle(
                          color: Colour.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '100 points ',
                        style: TextStyle(
                          color: Colour.greenishBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text:
                            'when they signup and you get 100 points when they signup',
                        style: TextStyle(
                          color: Colour.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                  sizedBoxHeight(screenHeight(context) * 0.02),
                  RoundContainer(
                    onTap: () {
                      Share.share(_shareText ?? '');
                    },
                    hPadding: 16,
                    vPadding: 12,
                    radius: 8,
                    color: Colour.extraLightGrey.withOpacity(0.3),
                    child: Row(
                      children: const <Widget>[
                        SubHeading1(
                          'Invite your friends',
                          color: Colour.subtitleColor,
                        ),
                        Spacer(),
                        CustomImageWidget(
                          image: Assets.contact,
                          scale: 1.5,
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(screenHeight(context) * 0.02),
                  const _ShareWithFriends(),
                  sizedBoxHeight(screenHeight(context) * 0.02),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colour.greenishBlue,
                    radius: const Radius.circular(12),
                    dashPattern: const <double>[6],
                    child: RoundContainer(
                      hPadding: 16,
                      radius: 8,
                      color: Colour.greyishBlue,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const CustomImageWidget(
                            image: Assets.link,
                            scale: 1.5,
                          ),
                          sizedBoxWidth(4),
                          SubHeading1(
                            state.userData.data?.referralCode ?? '',
                            color: Colour.greenishBlue,
                          ),
                          const Spacer(),
                          CustomTextButton(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(text: _shareText),
                              );
                              Share.share(_shareText ?? '');
                            },
                            width: screenWidth(context) * 0.36,
                            radius: 4,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            backgroundColor: Colour.greenishBlue,
                            text: 'COPY LINK',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
