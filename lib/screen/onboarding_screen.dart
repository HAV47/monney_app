import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/login_register/welcome_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController = StreamController<int>.broadcast();
  int curentpage = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
    super.initState();
  }

  @override
  Widget _buildItemOnboardingScreen(
      String image,
      String title,
      String subtitle,
      ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200.w),
          Center(child: Image.asset(image, scale: 2, fit: BoxFit.cover)),
          SizedBox(height: 100.w),
          Flexible(
            child: SizedBox(
              width: 300.w,
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: TextStyles.defaultStyle
                      .setFont('MontserratBold')
                      .bold
                      .setTextSize(24.w)
                      .setColor(ThemeColor.textBoldColor),
                  children: <TextSpan>[
                    TextSpan(text: '\n\n'),
                    TextSpan(
                        text: subtitle,
                        style: TextStyles.defaultStyle
                            .setColor(ThemeColor.textBlue)
                            .setFont('SfProDisplayLight')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetHelper.onboardingBackground))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page){
                setState(() {
                  curentpage = page;
                });
              },
              children: [
                _buildItemOnboardingScreen(
                    AssetHelper.onboarding1,
                    'Save your money conveniently.',
                    'Get 5% cash back for each transaction and spend it easily.'),
                _buildItemOnboardingScreen(
                    AssetHelper.onboarding2,
                    'Secure your money for free and get rewards.',
                    'Get the most secure payment app ever and enjoy it.'),
                _buildItemOnboardingScreen(
                    AssetHelper.onboarding3,
                    'Enjoy commission-free stock trading.',
                    'Online investing has never been easier than it is right now.')
              ],
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 20.w,
              child: Row(
                children: [
                  Expanded(
                    child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            dotHeight: 5.w,
                            dotWidth: 5.w,
                            activeDotColor:ThemeColor.textBlue
                        )),
                  ),
                  Expanded(
                    child: StreamBuilder<int>(
                        initialData: 0,
                        stream: _pageStreamController.stream,
                        builder: (context, snapshot) {
                          return ButtonWidget(
                            width: 150,
                            height: 70,
                            iconData: _pageController.page != 2 ? Icons.arrow_forward : null,
                            image: AssetHelper.button1,
                            title: _pageController.page != 2 ? 'Next' : 'Get Started',
                            onTap: () {
                              if (_pageController.page != 2) {
                                _pageController.nextPage(
                                    duration: const Duration(microseconds: 200),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.of(context)
                                    .pushNamed(WelcomeScreen.routeName);
                              }
                            },
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
