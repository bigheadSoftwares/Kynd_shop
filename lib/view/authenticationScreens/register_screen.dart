import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

import '../../utils/export_utilities.dart' as ex;
import '../../utils/export_utilities.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController referralCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const ex.BackgroundImageWidget(
            backgroundImage: ex.Assets.registerBackground,
          ),
          ListView(
            padding:
                EdgeInsets.fromLTRB(30, screenHeight(context) * 0.1, 30, 40),
            children: <Widget>[
              const Heading2(
                'Sign Up',
                size: 26,
                fontWeight: FontWeight.w700,
              ),
              sizedBoxHeight(screenHeight(context) * 0.01),
              SubHeading1(
                'Let\'s get you started',
                color: ex.Colour.lightGrey.withOpacity(0.7),
                size: 16,
              ),
              sizedBoxHeight(screenHeight(context) * 0.05),
              const SubHeading1(
                'Name',
                // color: Colour.lightGrey.withOpacity(0.7),
                size: 16,
              ),
              sizedBoxHeight(screenHeight(context) * 0.015),
              CustomTextField(
                controller: name,
                filled: true,
                fillColor: Colour.white,
                hintStyle: TextStyle(
                    color: ex.Colour.lightGrey.withOpacity(0.3),
                    fontWeight: FontWeight.w600),
                hintText: 'Enter your name',
              ),
              sizedBoxHeight(screenHeight(context) * 0.03),
              const SubHeading1(
                'Mobile number',
                // color: Colour.lightGrey.withOpacity(0.7),
                size: 16,
              ),
              sizedBoxHeight(screenHeight(context) * 0.015),
              CustomTextField(
                controller: mobileNumber,
                filled: true,
                fillColor: Colour.white,
                hintStyle: TextStyle(
                    color: ex.Colour.lightGrey.withOpacity(0.3),
                    fontWeight: FontWeight.w600),
                hintText: 'Enter your mobile number',
              ),
              sizedBoxHeight(screenHeight(context) * 0.03),
              const SubHeading1(
                'Referral Code',
                // color: Colour.lightGrey.withOpacity(0.7),
                size: 16,
              ),
              sizedBoxHeight(screenHeight(context) * 0.015),
              CustomTextField(
                controller: referralCode,
                filled: true,
                fillColor: Colour.white,
                hintStyle: TextStyle(
                    color: ex.Colour.lightGrey.withOpacity(0.3),
                    fontWeight: FontWeight.w600),
                hintText: 'Enter your referral code',
              ),
              sizedBoxHeight(screenHeight(context) * 0.2),
              CustomButton(
                radius: 25,
                backgroundColor: ex.Colour.greenishBlue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                onTap: () {
                  pushNamed(context, '/loginScreen');
                },
                child: const SubHeading1(
                  'SIGNUP',
                  color: ex.Colour.white,
                  size: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(screenHeight(context) * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SubHeading1(
                    'Already have an account? ',
                    size: 14,
                  ),
                  InkWell(
                    onTap: () {
                      pushReplacementNamed(context, '/loginScreen');
                    },
                    child: const SubHeading1(
                      'Login Now ',
                      size: 14,
                      color: ex.Colour.greenishBlue,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
