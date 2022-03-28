import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../logic/authentication/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/export_utilities.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController referralCode = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            const BackgroundImageWidget(
              backgroundImage: Assets.registerBackground,
            ),
            ListView(
              padding:
                  EdgeInsets.fromLTRB(30, screenHeight(context) * 0.1, 30, 40),
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Constants.isSkipped = true;
                      Constants.isLoggedIn = false;
                      Constants.authenticationModel = null;
                      saveBool(key: Constants.skippedStatus, value: true);
                      pushNamed(context, Routes.home);
                    },
                    child: const Text(
                      'SKIP',
                      // size: 18,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight(screenHeight(context) * 0.01),
                const Heading2(
                  'Let\'s Sign You In',
                  size: 26,
                  fontWeight: FontWeight.w700,
                ),
                sizedBoxHeight(screenHeight(context) * 0.01),
                SubHeading1(
                  "Welcome back, you've been missed!",
                  color: Colour.lightGrey.withOpacity(0.7),
                  size: 16,
                ),
                sizedBoxHeight(screenHeight(context) * 0.05),
                const SubHeading1(
                  'Name',
                  // color: Colour.lightGrey.withOpacity(0.7),
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                sizedBoxHeight(screenHeight(context) * 0.015),
                CustomTextField(
                  controller: name,
                  filled: true,
                  keyboardType: TextInputType.visiblePassword,
                  fillColor: Colour.white,
                  hintStyle: TextStyle(
                    color: Colour.lightGrey.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: 'Enter your name',
                  validate: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(screenHeight(context) * 0.03),
                const SubHeading1(
                  'Mobile number',
                  // color: Colour.lightGrey.withOpacity(0.7),
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                sizedBoxHeight(screenHeight(context) * 0.015),
                CustomTextField(
                  controller: mobileNumber,
                  filled: true,
                  fillColor: Colour.white,
                  keyboardType: TextInputType.number,
                  maxLength: Constants.maxPhoneNumberLength,
                  digitsOnly: true,
                  hintStyle: TextStyle(
                    color: Colour.lightGrey.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: 'Enter your mobile number',
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (value.trim().isNotEmpty &&
                        value.length < Constants.minPhoneNumberLength) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(screenHeight(context) * 0.03),
                const SubHeading1(
                  'Referral Code',
                  // color: Colour.lightGrey.withOpacity(0.7),
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                sizedBoxHeight(screenHeight(context) * 0.015),
                CustomTextField(
                  controller: referralCode,
                  keyboardType: TextInputType.visiblePassword,
                  filled: true,
                  fillColor: Colour.white,
                  hintStyle: TextStyle(
                      color: Colour.lightGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w600),
                  hintText: 'Enter your referral code',
                ),
                sizedBoxHeight(screenHeight(context) * 0.2),
                _RegisterButton(
                    formKey: _formKey,
                    name: name,
                    mobileNumber: mobileNumber,
                    referralCode: referralCode),
                sizedBoxHeight(screenHeight(context) * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SubHeading1(
                      'Already have an account? ',
                      size: 14,
                    ),
                    InkWell(
                      onTap: () => pop(context),
                      child: const SubHeading1(
                        'Login Now ',
                        size: 14,
                        color: Colour.greenishBlue,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.name,
    required this.mobileNumber,
    required this.referralCode,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController name;
  final TextEditingController mobileNumber;
  final TextEditingController referralCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        if (state is RegistrationSuccessful) {
          pop(context);
          showToast(
            'Registration Successful',
            duration: 6,
          );
        } else if (state is RegistrationError) {
          debugPrint('$state -> ${state.error.serverMessage}');
          showToast(
            state.error.serverMessage ?? state.error.message,
            duration: 6,
          );
        }
        context.read<AuthenticationCubit>().reset();
      },
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationLoading) {
          return const LoadingIndicator(height: 40);
        } else {
          return CustomButton(
            radius: 25,
            backgroundColor: Colour.greenishBlue,
            padding: const EdgeInsets.symmetric(vertical: 15),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationCubit>().register(
                      name: name.text,
                      phoneNo: mobileNumber.text,
                      dob: Constants.pickedAge!,
                      referral: referralCode.text,
                    );
              }
            },
            child: const SubHeading1(
              'SIGNUP',
              color: Colour.white,
              size: 18,
              fontWeight: FontWeight.w500,
            ),
          );
        }
      },
    );
  }
}
