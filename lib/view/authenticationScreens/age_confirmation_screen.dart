import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/custom_button.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/logo.dart';

class AgeConfirmationScreen extends StatelessWidget {
  AgeConfirmationScreen({Key? key}) : super(key: key);

  final TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const BackgroundImageWidget(
              backgroundImage: Assets.ageBackground,
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(
                25,
                screenHeight(context) * 0.06,
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
                    const Icon(Icons.check_box, color: Colour.greenishBlue),
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
                    pushNamed(context, '/introScreen');
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
