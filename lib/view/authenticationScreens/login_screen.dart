import 'dart:developer';

import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/functions/snackbar.dart';
import '../../logic/authentication/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/export_utilities.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileNumber = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (BuildContext context, AuthenticationState state) {
          if (state is LoginSuccessful) {
            showToast('${state.dataModel.success.code}');
            log('This is otp ${state.dataModel.success.code}');
            pushNamed(
              context,
              Routes.otpScreen,
              arguments: state.dataModel,
            );
          } else if (state is LoginError) {
            showSnackBar(context: context, msg: state.error.message);
          }
        },
        builder: (BuildContext context, AuthenticationState state) {
          return Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                const BackgroundImageWidget(
                  backgroundImage: Assets.loginBackground,
                ),
                ListView(
                  padding: EdgeInsets.fromLTRB(
                      30, screenHeight(context) * 0.1, 30, 20),
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
                          // fontWeight: FontWeight.w700,
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
                      'Welcome back, you\'ve been missed!',
                      color: Colour.lightGrey.withOpacity(0.7),
                      size: 16,
                    ),
                    sizedBoxHeight(screenHeight(context) * 0.05),
                    const SubHeading1(
                      'Mobile Number',
                      size: 18,
                    ),
                    sizedBoxHeight(screenHeight(context) * 0.015),
                    CustomTextField(
                      controller: mobileNumber,
                      filled: true,
                      fillColor: Colour.white,
                      hintStyle: TextStyle(
                          color: Colour.greenishBlue.withOpacity(0.3),
                          fontWeight: FontWeight.w600),
                      digitsOnly: true,
                      keyboardType: TextInputType.number,
                      maxLength: Constants.maxPhoneNumberLength,
                      hintText: '+91 XXXXXXXXXX',
                      validate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile Number is required';
                        }
                        if (value.trim().isNotEmpty &&
                            value.length < Constants.minPhoneNumberLength) {
                          return 'Please enter a valid mobile number';
                        }
                        return null;
                      },
                    ),
                    sizedBoxHeight(screenHeight(context) * 0.12),
                    state is AuthenticationLoading
                        ? const LoadingIndicator()
                        : CustomButton(
                            radius: 25,
                            backgroundColor: Colour.greenishBlue,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            onTap: () {
                              //Todo: Use AuthenticationCubit sendOtp function to send OTP for the
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AuthenticationCubit>()
                                    .validateAndLogin(
                                        phoneNo: mobileNumber.text);
                              }
                            },
                            child: const SubHeading2(
                              'LOGIN',
                              color: Colour.white,
                              size: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    sizedBoxHeight(screenHeight(context) * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SubHeading1(
                          'Don\'t have an account? ',
                          size: 14,
                        ),
                        InkWell(
                          onTap: () {
                            pushNamed(context, Routes.registerScreen);
                          },
                          child: const SubHeading1(
                            'Signup Now ',
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
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    mobileNumber.dispose();
    super.dispose();
  }
}
