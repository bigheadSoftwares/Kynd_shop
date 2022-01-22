import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/data/authentication/login_data_model.dart';
import 'package:kynd_shop/utils/functions/snackbar.dart';
import '../../logic/authentication/authentication_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/export_utilities.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.loginDataModel}) : super(key: key);
  final LoginDataModel loginDataModel;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = '';

  @override
  void initState() {
    super.initState();
    showToast('${widget.loginDataModel.success.code}');
    context.read<AuthenticationCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const BackgroundImageWidget(
            backgroundImage: Assets.otpBackground,
          ),
          ListView(
            padding:
                EdgeInsets.fromLTRB(30, screenHeight(context) * 0.14, 30, 20),
            children: <Widget>[
              const Heading2(
                'Verification Code',
                size: 26,
                fontWeight: FontWeight.w700,
              ),
              sizedBoxHeight(screenHeight(context) * 0.01),
              SubHeading1(
                'Verify your account by entering the 4 digits code we sent to :',
                color: Colour.lightGrey.withOpacity(0.7),
                size: 16,
              ),
              SubHeading1(
                widget.loginDataModel.success.userDetails.phone,
                color: Colour.lightGrey.withOpacity(0.7),
                size: 14,
              ),
              sizedBoxHeight(screenHeight(context) * 0.08),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (BuildContext context, AuthenticationState state) {
                  if (state is AuthenticationSuccessful) {
                    pushNamedAndRemoveUntil(context, Routes.home);
                  }
                },
                builder: (BuildContext context, AuthenticationState state) {
                  return Column(
                    children: <Widget>[
                      PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        blinkWhenObscuring: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(25),
                          errorBorderColor: Colour.greenishBlue,
                          fieldHeight: 65,
                          fieldWidth: 60,
                          inactiveColor: Colors.transparent,
                          activeColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colour.greenishBlue,
                          selectedFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (String v) {},
                        onChanged: (String value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (String? text) {
                          return true;
                        },
                      ),
                      if (state is AuthenticationError)
                        SubHeading2(
                          state.error.message,
                          color: Colour.red,
                          size: 14,
                        ),
                    ],
                  );
                },
              ),
              sizedBoxHeight(screenHeight(context) * 0.04),
              if (context.watch<AuthenticationCubit>().state
                  is AuthenticationLoading)
                const LoadingIndicator(height: 40)
              else
                CustomButton(
                  radius: 25,
                  backgroundColor: Colour.greenishBlue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  onTap: () {
                    if (textEditingController.text ==
                        widget.loginDataModel.success.code.toString()) {
                      context.read<AuthenticationCubit>().confirmCode(
                            userId: widget.loginDataModel.success.customerId,
                            confirmCode: widget.loginDataModel.success.code,
                            // confirmCode: 376488
                          );
                    } else {
                      showSnackBar(
                          context: context, msg: 'Please enter correct otp');
                    }
                  },
                  child: const SubHeading2(
                    'VERIFY',
                    color: Colour.white,
                    size: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              sizedBoxHeight(screenHeight(context) * 0.03),
              Center(
                child: SubHeading1(
                  'I did not receive a code',
                  color: Colour.lightGrey.withOpacity(0.7),
                  size: 12,
                ),
              ),
              const Center(
                child: SubHeading1(
                  'RESEND',
                  color: Colour.greenishBlue,
                  fontWeight: FontWeight.w700,
                  size: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
