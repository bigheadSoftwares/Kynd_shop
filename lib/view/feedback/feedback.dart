import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

part 'emojis.dart';

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  State<Feedback> createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  final TextEditingController _feedback = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _feedback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Feedback',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          sizedBoxHeight(screenHeight(context) * 0.02),
          const Heading2(
            'How do you feel?',
            fontWeight: FontWeight.bold,
          ),
          sizedBoxHeight(screenHeight(context) * 0.01),
          const SubHeading2(
            'We would love to hear more about your experience!. Tell us about your experience',
            color: Colour.subtitleColor,
          ),
          sizedBoxHeight(screenHeight(context) * 0.02),
          _Emojis(),
          sizedBoxHeight(screenHeight(context) * 0.02),
          const SubHeading1(
            'Give us feedback',
            fontWeight: FontWeight.w500,
          ),
          sizedBoxHeight(8),
          Form(
            key: _formKey,
            child: CustomTextField(
              controller: _feedback,
              borderRadius: 10,
              filled: true,
              minLines: 4,
              maxLines: 10,
              cursorColor: Colour.greenishBlue,
              focusBorderColor: Colour.greenishBlue,
              fillColor: Colour.offWhite,
              hintText: 'Enter some description for',
              maxLength: 100,
              validate: (String? value) {
                if (value == null || value.isEmpty || value == '') {
                  return 'Please enter a valuable feedback';
                }
              },
            ),
          ),
          sizedBoxHeight(16),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        radius: 25,
        width: screenWidth(context) * 0.9,
        backgroundColor: Colour.greenishBlue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        onTap: () {
          if (_formKey.currentState!.validate()) {
            pop(context);
          }
        },
        child: const SubHeading2(
          'SUBMIT',
          color: Colour.white,
          size: 18,
        ),
      ),
    );
  }
}
