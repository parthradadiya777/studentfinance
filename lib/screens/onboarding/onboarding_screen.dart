import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  // final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // var router = AutoRouter.of(context);
    // router.replace(const DashboardRoute());
  }

  Widget _buildImage(String assetName, [double radius = 350]) {
    return SizedBox(
        width: radius,
        height: radius,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/$assetName'),
          radius: radius,
        ));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.all(16),
      pageColor: backgroundColor,
      imagePadding: const EdgeInsets.all(32),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  ElevatedButton(
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _onIntroEnd(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Sign In',
                              style: TextStyle(
                                  decoration: TextDecoration.underline)))
                    ],
                  )
                ]))),
      ),
      // pages: [
      //   PageViewModel(
      //     title: "Fractional shares",
      //     body:
      //         "Instead of having to buy an entire share, invest any amount you want.",
      //     image: _buildImage('splash.png'),
      //     decoration: pageDecoration,
      //   ),
      //   PageViewModel(
      //     title: "Kids and teens",
      //     body:
      //         "Kids and teens can track their stocks 24/7 and place trades that you approve.",
      //     image: _buildImage('splash.png'),
      //     decoration: pageDecoration,
      //   ),
      // ],
      // onDone: () => _onIntroEnd(context),
      // //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      // showSkipButton: false,
      // showBackButton: false,
      // //rtl: true, // Display as right-to-left
      // curve: Curves.fastLinearToSlowEaseIn,
      // dotsDecorator: const DotsDecorator(
      //   size: Size(8.0, 8.0),
      //   color: Color(0xFFBDBDBD),
      //   activeSize: Size(22.0, 8.0),
      //   activeShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
      //   ),
      // ),
    );
  }
}
