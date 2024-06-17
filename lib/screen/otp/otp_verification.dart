import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/otp/profile_setup.dart';
import 'package:monneyapp/widget/button_widget.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  static  const String routeName = 'otp_verification';

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String? otpInput = '';

  @override
  Widget build(BuildContext context) {
    final String mobileNumber =
        ModalRoute.of(context)?.settings.arguments as String;
    bool isButtonEnabled = otpInput?.length == 4 && otpInput == '1234';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                AssetHelper.otp,
                scale: 2,
                alignment: Alignment.bottomCenter,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 320,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'OTP Verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: '\nEnter the OTP sent to ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '$mobileNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: 60,
              cursorColor: Colors.transparent,
              borderColor: ThemeColor.textBoldColor,
              onSubmit: (String value) {
                print(value);
                setState(() {
                  if (value.length == 4) {
                    otpInput = value;
                    isButtonEnabled = true;
                  } else {
                    isButtonEnabled = false;
                  }
                });
              },
            ),
            SizedBox(height: 50.w),
            RichText(
              text: TextSpan(
                text: 'Didn\'t you receive the OTP?',
                style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat'),
                children:  <TextSpan>[
                  TextSpan(text: ' Resend OTP', style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat').setColor(ThemeColor.textBoldColor)),
                ],
              ),
            ),
            SizedBox(height: 50.w),

            Opacity(
                opacity: isButtonEnabled ? 1 : 0.5,
                child: ButtonWidget(
                    title: 'Verify',
                    width: 320.w,
                    height: 70.w,
                    image: AssetHelper.signIn,
                    onTap: isButtonEnabled
                        ? () {
                            Navigator.of(context)
                                .pushNamed(CompleteScreen.routeName);
                          }
                        : null)),
          ],
        ),
      ),
    );
  }
}
