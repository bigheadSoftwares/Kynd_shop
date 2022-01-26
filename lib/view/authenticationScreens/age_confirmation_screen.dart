import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/logo.dart';

class AgeConfirmationScreen extends StatefulWidget {
  const AgeConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<AgeConfirmationScreen> createState() => _AgeConfirmationScreenState();
}

class _AgeConfirmationScreenState extends State<AgeConfirmationScreen> {
  final TextEditingController age = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? pickedDate;
  bool _isAgreed = false;

  void _onCheckboxTap() {
    setState(() {
      _isAgreed = !_isAgreed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            const BackgroundImageWidget(
              backgroundImage: Assets.ageBackground,
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(
                25,
                screenHeight(context) * 0.08,
                25,
                20,
              ),
              children: <Widget>[
                Logo(
                  logoImage: Assets.logoIcon,
                  height: screenHeight(context) * 0.1,
                  width: screenWidth(context) * 0.3,
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.06,
                ),
                const _CenterTextWidget(text: 'You need to be above'),
                sizedBoxHeight(screenHeight(context) * 0.006),
                const _CenterTextWidget(text: '25 years of age'),
                sizedBoxHeight(
                  screenHeight(context) * 0.04,
                ),
                const _CenterTextWidget(
                  text: 'Enter Your Birth Year',
                  size: 18,
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.03,
                ),
                CustomTextField(
                  controller: age,
                  filled: true,
                  hintText: 'DD/MM/YYY',
                  readOnly: true,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your birth year';
                    } else if ((DateTime.now().year - pickedDate!.year) < 25) {
                      return 'You need to be above 25 years of age';
                    }
                  },
                  onTap: () async {
                    pickedDate = await pickDate(context);
                    if (pickedDate == null) {
                      showToast('Please select your date of birth');
                    } else {
                      Constants.pickedAge = pickedDate;
                      age.text =
                          '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}';
                    }
                  },
                  fillColor: Colour.white,
                ).outerNeumorphism(
                  offset: const Offset(8, 8),
                  borderRadius: 10,
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _isAgreed
                        ? IconButton(
                            onPressed: _onCheckboxTap,
                            icon: const Icon(Icons.check_box,
                                color: Colour.greenishBlue))
                        : IconButton(
                            onPressed: _onCheckboxTap,
                            icon: const Icon(Icons.check_box_outline_blank,
                                color: Colour.lightGrey)),
                    sizedBoxWidth(screenWidth(context) * 0.02),
                    const SubHeading2(
                      'I agree the Terms & Conditions',
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.05,
                ),
                const _DetailsListTile(
                  text:
                      'You must be of legal drinking age to order from liquor store',
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.02,
                ),
                const _DetailsListTile(
                  text:
                      'As per Govt. guidelines, your ID may be verified at the time of delivery.',
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.04,
                ),
                const CustomListTile(
                  spaceBetweenLeadingAndTitle: 0,
                  title: Center(
                    child: SubHeading2(
                      'ID details are for one-time verification. It is safe & secure.',
                      size: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                sizedBoxHeight(
                  screenHeight(context) * 0.04,
                ),
                CustomButton(
                  radius: 25,
                  backgroundColor: Colour.greenishBlue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  onTap: () {
                    if (_formKey.currentState!.validate() && _isAgreed) {
                      if (Constants.isIntroSeen) {
                        pushNamed(context, Routes.loginScreen);
                      } else {
                        pushNamed(context, Routes.introScreens);
                      }
                    }
                    if (!_isAgreed) {
                      showToast('Please accept the terms and condition');
                    }
                  },
                  child: const SubHeading2(
                    'CONTINUE',
                    color: Colour.white,
                    size: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DetailsListTile extends StatelessWidget {
  const _DetailsListTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: const Icon(
        Icons.circle,
        color: Colour.greenishBlue,
        size: 15,
      ),
      spaceBetweenLeadingAndTitle: screenWidth(context) * 0.03,
      title: SubHeading2(
        text,
        size: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _CenterTextWidget extends StatelessWidget {
  const _CenterTextWidget({
    Key? key,
    required this.text,
    this.size,
  }) : super(key: key);

  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SubHeading1(
      text,
      size: size ?? 22,
      fontWeight: FontWeight.w700,
    ));
  }
}
