import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/home/cards_screen.dart';
import 'package:monneyapp/screen/home/home_screen.dart';
import 'package:monneyapp/screen/home/information_screen.dart';
import 'package:monneyapp/screen/home/notification_screen.dart';
import 'package:monneyapp/screen/login_register/welcome_screen.dart';
import 'package:monneyapp/screen/tranfer/transfer_screen.dart';
import 'package:monneyapp/screen/transactions/transaction_screen.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:monneyapp/widget/shared_preferences_util_widget.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const  String routeName = 'main_app';

  @override
  State<MainApp> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  String? username;
  String? firstName;
  String? lastName;

  void loadUserData() async {
    Map<String, String?> userData = await SharedPreferencesUtil.getUserData();
    setState(() {
      username = userData['username'];
      firstName = userData['firstName'];
      lastName = userData['lastName'];
    });
  }


  List<Widget> widgetOptions = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    loadUserData();
    widgetOptions = [
      HomeScreen(openDrawer: openDrawer, buildContext: context,),
      NotificationScreen(),
      InformationScreen(),
    ];
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        backgroundColor: ThemeColor.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(InformationScreen.routeName);
              },
              child: DrawerHeader(
                padding: EdgeInsets.fromLTRB(20.w, 50.w, 0.w, 30.w),
                child: ListTile(
                  leading: Image.asset(
                    AssetHelper.profileImage,
                    scale: 3,
                  ),
                  title: Text(
                    '$firstName',
                    style: TextStyles.defaultStyle.bold
                        .setColor(Colors.black)
                        .setFont('MontserratBold')
                        .setTextSize(16.sp),
                  ),
                  subtitle: Text(
                    '$username',
                    style: TextStyles.defaultStyle.regular
                        .setColor(Colors.black)
                        .setFont('Montserrat')
                        .setTextSize(16.sp),
                  ),
                ),
              ),
            ),
            drawerTile(AssetHelper.drawer1, 'Payment', () {
              Navigator.of(context).pushNamed(TransferScreen.routeName);
            }),
            drawerTile(
                AssetHelper.drawer2, 'Transactions', () {
              Navigator.of(context).pushNamed(TransactionScreen.routeName);
            }),
            drawerTile(AssetHelper.drawer3, 'My Cards', () {
              Navigator.of(context).pushNamed(CardsScreen.routeName);
            }),
            drawerTile(
                AssetHelper.drawer4, 'Promotions', () => print('object')),
            drawerTile(AssetHelper.drawer5, 'Savings', () => print('object')),
            Spacer(),
            ButtonWidget(
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
            )
          ],
        ),
      ),

      body: widgetOptions[
      _selectedIndex
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: '•',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: '•',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '•',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeColor.iconColor,
        onTap: _onItemTapped,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,

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
