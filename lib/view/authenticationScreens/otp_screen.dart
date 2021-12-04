import 'dart:async';

import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/export_utilities.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
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
                '+91 8888888888',
                color: Colour.lightGrey.withOpacity(0.7),
                size: 14,
              ),
              sizedBoxHeight(screenHeight(context) * 0.08),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  blinkWhenObscuring: false,
                  animationType: AnimationType.fade,
                  // validator: (String? v) {
                  //   if (v!.length < 3) {
                  //     return "I'm from validator";
                  //   } else {
                  //     return null;
                  //   }
                  // },
     
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
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (String v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              sizedBoxHeight(screenHeight(context) * 0.04),
              CustomButton(
                radius: 25,
                backgroundColor: Colour.greenishBlue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                onTap: () {
                  pushReplacementNamed(context, Routes.addAddress);
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
                  'I did not recieve a code',
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
