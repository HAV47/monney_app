import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/login_register/login_screen.dart';
import 'package:monneyapp/screen/login_register/register_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const String routeName = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetHelper.register),
              scale: 2,
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Spacer(),
            ButtonWidget(
              title: 'Sign In',
              image: AssetHelper.signIn,
              iconData: Icons.arrow_forward,
              width: double.infinity,
              height: 50.w,
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
            ),
            SizedBox(height: 20.w),
            ButtonWidget(
              title: 'Sign Up',
              width: double.infinity,
              height: 50.w,
              iconData: Icons.arrow_forward,
              colorIcon: ThemeColor.textBoldColor,
              textStyle:
                  TextStyles.defaultStyle.textBoldColor.setTextSize(20.sp),
              border: true,
              onTap: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
            ),
            SizedBox(
              height: 30.w,
            ),
          ],
        ),
      ),
    );
  }
}
