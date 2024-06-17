import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/login_register/welcome_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:monneyapp/widget/shared_preferences_util_widget.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  static const String routeName = 'information_screen';

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  String? username;
  String? firstName;
  String? lastName;

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    Map<String, String?> userData = await SharedPreferencesUtil.getUserData();
    setState(() {
      username = userData['username'];
      firstName = userData['firstName'];
      lastName = userData['lastName'];

      usernameController.text = username ?? '';
      firstNameController.text = firstName ?? '';
      lastNameController.text = lastName ?? '';
    });
  }

  void saveUserData() async {
    String username = usernameController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;

    await SharedPreferencesUtil.setUserData(username, firstName, lastName);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Đã lưu')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetHelper.backgroundScaf),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90.w),
              Text('Profile', style: TextStyles.defaultStyle.bold.setTextSize(40.sp).setFont('MontserratBold')),
              SizedBox(height: 30.w),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                leading: CircleAvatar(
                  backgroundImage: const AssetImage(AssetHelper.notificationImage),
                  radius: 40.w,
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  '$username', style: TextStyles.defaultStyle.medium.setFont('SFProText').setTextSize(20.sp).textBoldColor,
                ),
                subtitle: Text('Online',
                    style: TextStyles.defaultStyle.light.textBoldColor.setFont('SfProDisplayLight')),
              ),
              SizedBox(height: 20.w),
              TextField(
                controller: usernameController,
                style: TextStyles.defaultStyle.regular.textBoldColor.setTextSize(14.sp).setFont('SFProText'),
                decoration: const InputDecoration(
                    labelText: 'Username',
                ),
              ),
              SizedBox(height: 20.w),
              TextField(
                controller: firstNameController,
                style: TextStyles.defaultStyle.regular.textBoldColor.setTextSize(14.sp).setFont('SFProText'),
                decoration: const InputDecoration(
                    labelText: 'First Name',
                )),
              SizedBox(height: 20.w),
              TextField(
                controller: lastNameController, style: TextStyles.defaultStyle.regular.textBoldColor.setTextSize(14.sp).setFont('SFProText'),
                decoration: const InputDecoration(
                    labelText: 'Last Name',)
              ),
              SizedBox(height: 20.w),
              ElevatedButton(
                onPressed: saveUserData,
                child: Text('Update'),
              ),
              SizedBox(height: 50.w),
              Center(
                child: ButtonWidget(
                  title: 'Sign out',
                  colorIcon: ThemeColor.textBoldColor,
                  width: 220.w,
                  height: 70.w,
                  border: true,
                  color: ThemeColor.white,
                  textStyle: TextStyles.defaultStyle.textBoldColor.regular
                      .setFont('Montserrat'),
                  iconData: Icons.logout,onTap: (){
                  Navigator.of(context).pushNamed(WelcomeScreen.routeName);
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
