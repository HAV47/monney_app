import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/main_app.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  static const String routeName = 'login_screen';
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailExists = false;
  String? savedPassword;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEmails = prefs.getStringList('emails');
    if (savedEmails != null && savedEmails.isNotEmpty) {
      setState(() {
        emailController.text = savedEmails.last;
        emailExists = true;
      });
    }
    savedPassword = prefs.getString('password');
  }

  void checkEmailExists(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEmails = prefs.getStringList('emails') ?? [];
    setState(() {
      emailExists = savedEmails.contains(email);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetHelper.signInUp),fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: emailExists
                      ? Icon(Icons.check, color: Colors.purpleAccent)
                      : Icon(Icons.close, color: Colors.red),
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: checkEmailExists,
              ),
              SizedBox(height: 20.w),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.w),
              Text('Forgot Password',style: TextStyles.defaultStyle.setTextSize(16).setFont('Roboto').regular.setColor(ThemeColor.textBoldColor)),
              SizedBox(height: 35.w),
              Center(
                child: ButtonWidget(title: 'Sign In', width: 315, height: 70,iconData: Icons.arrow_forward,image: AssetHelper.signIn,border: false,
                onTap: (){
                  if (savedPassword != null && savedPassword == passwordController.text) {
                    print('Sucsessfully');
                    Navigator.of(context).pushNamed(MainApp.routeName);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Thông báo"),
                          content: Text("Tài khoản hoặc mật khẩu không chính xác. Vui lòng kiểm tra lại."),
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
                },),
              ),
              SizedBox(height: 50.w),
            ],
          ),
        ),
      ),
    );
  }
}
