import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  int _current = 0;
  final PageController _controller = PageController();
  final List<String> _images = [
    Assets.intro1,
    Assets.intro2,
    Assets.intro3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: _controller,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Image.asset(
              _images[index],
              height: screenHeight(context),
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Heading1(
                    'Super Fast Delivery Everywhere',
                    size: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  sizedBoxHeight(
                    screenHeight(context) * 0.02,
                  ),
                  const SubHeading2(
                    'With a goal, Health can recommend a bedtime and wake-up alarm.',
                    fontWeight: FontWeight.w500,
                    size: 14,
                    color: Colors.white,
                  ),
                  sizedBoxHeight(
                    screenHeight(context) * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      CustomTextButton(
                        width: screenWidth(context) * 0.4,
                        text: 'Get Started',
                        onTap: () {
                          pushReplacementNamed(context, '/loginScreen');
                        },
                        backgroundColor: Colour.white,
                        textColor: Colour.black,
                        radius: 25,
                        fontSize: 20,
                      ),
                      const Spacer(),
                      _indicator(_current == 0),
                      _indicator(_current == 1),
                      _indicator(_current == 2),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
      itemCount: 3,
      onPageChanged: (int index) {
        setState(() {
          _current = index;
        });
      },
    ));
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          isActive
              ? BoxShadow(
                  color: const Color(0XFF2FB7B2).withOpacity(0.72),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                )
              : const BoxShadow(
                  color: Colors.transparent,
                )
        ],
        borderRadius: isActive ? BorderRadius.circular(20) : null,
        shape: isActive ? BoxShape.rectangle : BoxShape.circle,
        color: Colour.white,
      ),
    );
  }
}
