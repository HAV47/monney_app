import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/main_app.dart';
import 'package:monneyapp/screen/home/home_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  static const String routeName = 'profile_setup';

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool dataExists = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    loadDataFromSharedPreferences();
  }

  void loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      firstNameController.text = prefs.getString('firstName') ?? '';
      lastNameController.text = prefs.getString('lastName') ?? '';
      isButtonEnabled = isInputValid();
    });
  }

  void saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernameController.text);
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    setState(() {
      // dataExists = true;
      isButtonEnabled = isInputValid();
    });
  }

  bool isInputValid() {
    return usernameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'background',
          child: Container(
            decoration: BoxDecoration(gradient: Gradients.scaffoldLinear),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: ThemeColor.white),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: 'avt',
                      child: Center(
                          child: Image.asset(AssetHelper.profileImage,scale: 2,))),
                  SizedBox(height: 40.w),
                  Text('Username',style: TextStyles.defaultStyle.setTextSize(14.sp).setColor(Color(0xFF80E0FF)).setFont('Roboto')),
                  inputText(usernameController, 'Your Username'),
                  SizedBox(height: 20.w),
                  Text('First name', style: TextStyles.defaultStyle.setTextSize(14.sp).setColor(Color(0xFF80E0FF)).setFont('Roboto')),
                  inputText(firstNameController, 'Your name'),
                  SizedBox(height: 20.w),
                  Text('Last name', style: TextStyles.defaultStyle.setTextSize(14.sp).setColor(Color(0xFF80E0FF)).setFont('Roboto')),
                  inputText(lastNameController, 'Your Username'),
                  SizedBox(height: 100.w),
                  Opacity(
                    opacity: isButtonEnabled ? 1 : 0.5,
                    child: ButtonWidget(title: 'Complete', width: 320.w, height: 70.w, color: Colors.white, textStyle: TextStyles.defaultStyle.light.setColor(ThemeColor.textBoldColor),
                      onTap: () {
                        print('đã lưu');
                        if (isInputValid()) {
                          saveDataToSharedPreferences();
                          Navigator.of(context).pushNamed(MainApp.routeName);
                        } else {
                          null;
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputText(TextEditingController controller, String hintText) {
    return TextField(
      style: TextStyles.defaultStyle.whiteTextColor
          .setTextSize(14.sp)
          .setFont('Roboto'),
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyles.defaultStyle.light
              .setColor(ThemeColor.white)
              .setTextSize(14.sp)
              .setFont('Roboto'),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.white))),
      onChanged: (value) {
        setState(() {
          isButtonEnabled = isInputValid();
        });
      },
    );
  }
}
