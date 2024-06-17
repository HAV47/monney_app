import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/otp/otp_verification.dart';
import 'package:monneyapp/widget/button_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const String routeName = 'otp_screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(AssetHelper.otp,
                  scale: 2, alignment: Alignment.bottomCenter),
            ),
            SizedBox(height: 30.w),
            SizedBox(
              width: 320.w,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'OTP Verification',
                      style: TextStyles.defaultStyle.bold.defaultTextColor
                          .setTextSize(24.sp),
                      children: <TextSpan>[
                        TextSpan(text: '\n'),
                        TextSpan(
                            text:
                                '\nWe will send you a one-time password to this mobile number',
                            style: TextStyles.defaultStyle
                                .setTextSize(16.sp)
                                .light)
                      ])),
            ),
            SizedBox(height: 20.w),
            SizedBox(
              width: 250.w,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: 'Enter mobile number',
                    labelStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
                    focusColor: ThemeColor.textBoldColor),
                controller: mobileNumberController,
              ),
            ),
            SizedBox(height: 100.w),
            ButtonWidget(
              title: 'Get OTP',
              width: 320.w,
              height: 70.w,
              image: AssetHelper.signIn,
              onTap: () {
                String mobileNumber = mobileNumberController.text;
                if (mobileNumber.isNotEmpty) {
                  Navigator.pushNamed(context,OtpVerification.routeName,
                    arguments: mobileNumber);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: const Text('Please enter a mobile number.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
