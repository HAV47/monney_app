import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/otp/otp_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();

  const RegisterScreen({super.key});

  static const String routeName = 'register_screen';
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController easswordController = TextEditingController();
  Color emailColor = Colors.grey;
  bool emailError = false;
  bool easswordError = false;
  bool _obscureText = true;

  void validateEmail(String email) {
    setState(() {
      emailError =
          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
      emailColor = emailError ? Colors.red : Colors.grey;
    });
  }

  void validatePassword(String password) {
    setState(() {
      easswordError = password.length < 6;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void saveRegistrationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedEmails = prefs.getStringList('emails') ?? [];
    savedEmails.add(emailController.text);
    prefs.setStringList('emails', savedEmails);
    print('Registration data saved');
  }

  void showPasswordMissingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thông báo"),
          content: const Text("Vui lòng nhập mật khẩu."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetHelper.signInUp), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: emailColor),
                  errorText: emailError ? 'Invalid email' : null,
                ),
                onChanged: validateEmail,
              ),
              SizedBox(height: 20.w),
              TextField(
                controller: easswordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  errorText: easswordError ? 'Password too short' : null,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20.sp),
                    onPressed: togglePasswordVisibility,
                  ),
                ),
                onChanged: validatePassword,
                obscureText: _obscureText,
              ),
              SizedBox(height: 20.w),
              Text('Forgot Password',style: TextStyles.defaultStyle.setTextSize(16).setFont('Roboto').regular.setColor(ThemeColor.textBoldColor)),
              SizedBox(height: 35.w),
              Center(
                child: ButtonWidget(
                    title: 'Sign Up',
                    width: 315,
                    height: 70,
                    iconData: Icons.arrow_forward,
                    image: AssetHelper.signIn,
                    onTap: () {
                      if (!emailError) {
                        if (easswordController.text.isEmpty) {
                          showPasswordMissingDialog();
                        } else {
                          saveRegistrationData();
                          print('Registered successfully');
                          Navigator.of(context)
                              .pushNamed(OtpScreen.routeName);
                        }
                      } else {
                        print('Registration failed');
                      }
                    }),
              ),
              SizedBox(height: 50.w),
            ],
          ),
        ),
      ),
    );
  }
}
