import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../logic/authentication/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/custom_button.dart';

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
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            const BackgroundImageWidget(
              backgroundImage: Assets.loginBackground,
            ),
            ListView(
              padding:
                  EdgeInsets.fromLTRB(30, screenHeight(context) * 0.1, 30, 20),
              children: <Widget>[
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
                  maxLength: 10,
                  hintText: '+91 XXXXXXXXXX',
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile Number is required';
                    }
                    if (value.length != 10) {
                      return 'Mobile Number must be 10 digits';
                    }
                    return null;
                  },
                ),
                sizedBoxHeight(screenHeight(context) * 0.12),
                CustomButton(
                  radius: 25,
                  backgroundColor: Colour.greenishBlue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  onTap: () {
                    //Todo: Use AuthenticationCubit sendOtp function to send OTP for the
                    if (_formKey.currentState!.validate()) {
                      pushNamed(
                        context,
                        Routes.otpScreen,
                        arguments: mobileNumber.text,
                      );
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
      ),
    );
  }

  @override
  void dispose() {
    mobileNumber.dispose();
    super.dispose();
  }
}
