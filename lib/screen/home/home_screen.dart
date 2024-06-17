import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/home/cards_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:monneyapp/widget/shared_preferences_util_widget.dart';

class HomeScreen extends StatefulWidget {
  final String? data;

  const HomeScreen(
      {super.key,
      this.data,
       this.openDrawer,
       this.buildContext});

  final void Function(BuildContext)? openDrawer;
  final BuildContext? buildContext;

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  String? firstName;
  String? lastName;
  String greeting = '';
  double balance = 0.0;

  @override
  void initState() {
    super.initState();
    loadUserData();
    updateGreeting();
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateGreeting();
    });
    loadBalance();
  }

  void updateGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'Morning';
    } else if (hour < 18) {
      greeting = 'Afternoon';
    } else {
      greeting = 'Evening';
    }
    setState(() {
      greeting = greeting;
    });
  }


  void loadUserData() async {
    Map<String, String?> userData = await SharedPreferencesUtil.getUserData();
    setState(() {
      username = userData['username'];
      firstName = userData['firstName'];
      lastName = userData['lastName'];
    });
  }

  void loadBalance() async {
    double storedBalance = await SharedPreferencesUtil.getBalance();
    if (storedBalance == 0.0) {
      setState(() {
        balance = 90000.0;
      });
      await SharedPreferencesUtil.setBalance(balance);
    } else {
      setState(() {
        balance = storedBalance;
      });
    }
  }

  void updateBalance(double newBalance) {
    setState(() {
      balance = newBalance;
    });
    saveBalance(newBalance);
  }

  void saveBalance(double newBalance) async {
    await SharedPreferencesUtil.setBalance(newBalance);
    setState(() {
      balance = newBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Stack(
        children: [
          Hero(
            tag: 'background',
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  gradient: Gradients.scaffoldLinear,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70.w),
                      bottomRight: Radius.circular(70.w))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.openDrawer!(context);
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: ThemeColor.white,
                          )),
                      const Spacer(),
                      Hero(
                          tag: 'avt',
                          child: Image.asset(
                            AssetHelper.profileImage,
                            scale: 3,
                          )),
                    ],
                  ),
                  SizedBox(height: 20.w),
                  SizedBox(
                      width: 200.w,
                      child: Text('Good $greeting $firstName,',
                          style: TextStyles.defaultStyle.regular
                              .setTextSize(24.sp)
                              .setColor(ThemeColor.white)
                              .setFont('Montserrat'))),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    height: 320.w,
                    width: 320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.w),
                      color: ThemeColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 50,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Your total balance',
                                style: TextStyles.defaultStyle.regular
                                    .setTextSize(16.sp)
                                    .setFont('Montserrat')),
                            Spacer(),
                            Icon(Icons.more_horiz)
                          ],
                        ),
                        Text('\$$balance',
                            style: TextStyles.defaultStyle.bold.textBoldColor
                                .setTextSize(16.sp)
                                .setFont('MontserratBold')),
                        SizedBox(height: 20.w),
                        Image.asset(
                          AssetHelper.blanceChart,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.w),
                  ButtonWidget(
                    title: 'Check your \n   bank account',
                    width: 320,
                    height: 140,

                    image: AssetHelper.check,
                    textStyle: TextStyles.defaultStyle.regular.whiteTextColor
                        .setTextSize(20.sp)
                        .setFont('Montserrat'),
                    iconData: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).pushNamed(CardsScreen.routeName);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerTile(String image, String title, Function()? onTap) {
    return ListTile(
      autofocus: true,
      focusColor: ThemeColor.grey,
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: 50.w, right: 20.w),
      leading: Image.asset(image, scale: 1.4),
      title: Text(title,
          style: TextStyles.defaultStyle.regular
              .setFont('Montserrat')
              .setTextSize(14.sp)
              .setColor(ThemeColor.blueDark)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ThemeColor.blueDark,
        size: 16.w,
      ),
    );
  }
}






