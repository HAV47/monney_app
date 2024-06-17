import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/screen/transactions/format_balance.dart';
import 'package:monneyapp/widget/button_widget.dart';
import 'package:monneyapp/widget/shared_preferences_util_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  static const String routeName = 'transaction_screen';

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  double balance = 0.0;

  @override
  void initState() {
    super.initState();
    loadBalance();
  }

  void loadBalance() async {
    double storedBalance = await SharedPreferencesUtil.getBalance();
    if (storedBalance == 0.0) {
      setState(() {
        balance = 1063.30;
      });
      await SharedPreferencesUtil.setBalance(balance);
    } else {
      setState(() {
        balance = formatBalance(storedBalance);
      });
    }
  }

  void saveBalance(double newBalance) async {
    await SharedPreferencesUtil.setBalance(newBalance);
    setState(() {
      balance = newBalance;
    });
  }
  void spend(double amount) {
    setState(() {
      balance -= amount;
    });
    SharedPreferencesUtil.setBalance(balance);
  }
  void updateBalace(double newBalance) {
    setState(() {
      balance = newBalance;
    });
    saveBalance(newBalance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      body: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      gradient: Gradients.scaffoldLinear,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70.w),
                          bottomRight: Radius.circular(70.w))),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text('Transactions',
                        style: TextStyles.defaultStyle.bold.whiteTextColor
                            .setTextSize(15.sp)
                            .setFont('SFProText')),
                    centerTitle: true,
                  ),
                  const Spacer(),
                  Text(
                    'Your total expences',
                    style: TextStyles.defaultStyle.regular
                        .setTextSize(22.sp)
                        .setFont('Montserrat')
                        .setColor(const Color(0xFF87F0FF)),
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    '\$${formatBalance(balance)}',
                    style: TextStyles.defaultStyle.bold.whiteTextColor
                        .setFont('MontserratBold')
                        .setTextSize(26.sp),
                  ),
                  SizedBox(height: 30.w,)
                ],
              ),),
              SizedBox(height: 20.w),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Track your expences',style:TextStyles.defaultStyle.bold.setFont('MontserratBold').setTextSize(22.sp)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      image: const DecorationImage(
                        image: AssetImage(AssetHelper.travel)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Travel',style: TextStyles.defaultStyle.regular.setFont('Montserrat').setColor(const Color(0xFFA73131))),
                        Text('\$399',style: TextStyles.defaultStyle.bold.setFont('Montserrat').setColor(const Color(0xFFA73131)).setTextSize(24.sp),)
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 150.w,
                    height: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      image: const DecorationImage(
                        image: AssetImage(AssetHelper.shopping)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Shopping',style: TextStyles.defaultStyle.regular.setFont('Montserrat').setColor(const Color(0xFFA27430))),
                        Text('\$375',style: TextStyles.defaultStyle.bold.setFont('Montserrat').setColor(const Color(0xFFA27430)).setTextSize(24.sp),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      image: const DecorationImage(
                        image: AssetImage(AssetHelper.sport)
                      )
                    ),
                    ///
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sport',style: TextStyles.defaultStyle.regular.setFont('Montserrat').setColor(const Color(0xFF298693))),
                        Text('\$199.8',style: TextStyles.defaultStyle.bold.setFont('Montserrat').setColor(const Color(0xFF298693)).setTextSize(24.sp),)
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 150.w,
                    height: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      image:const  DecorationImage(
                        image: AssetImage(AssetHelper.medicine),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Medicine',style: TextStyles.defaultStyle.regular.setFont('Montserrat').setColor(const Color(0xFF9137BC))),
                        Text('\$89.5',style: TextStyles.defaultStyle.bold.setFont('Montserrat').setColor(const Color(0xFF9137BC)).setTextSize(24.sp),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.w),
              ButtonWidget(title: 'Credit card \nrepayment', width: 320.w, height: 100.w,image: AssetHelper.check,iconData: Icons.arrow_forward_ios,
              onTap: (){

              },)

            ],
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.7,
              minChildSize: 0.2,
              builder: (context , scrollController){
            return Container(
              width: MediaQuery.of(context).size.width,
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              decoration:  BoxDecoration(
                gradient: Gradients.buttonLinear,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.w),
                    topRight: Radius.circular(40.w)),
              ),
              child:ListView(
                controller: scrollController,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin:  EdgeInsets.only(top: 16.w),
                    child: Container(
                      height: 5,
                      width: 60,
                      decoration:  BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.w)),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.w),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff05199E),
                      focusColor: const Color(0xff05199E),
                      hintText: 'Search',
                      hintStyle: TextStyles.defaultStyle.regular.setTextSize(18.sp).setFont('SfProDisplayLight').setColor(const Color(0xff3D56FA)),
                      prefixIcon: const Icon(Icons.search,color: ThemeColor.iconColor,),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.w),
                  spendingCategory(const Color(0xFFe09fff),AssetHelper.cate2,'Medicine','13 Mar 2019, 12:10 AM',89,spend),
                  spendingCategory(const Color(0xFFffcf87),AssetHelper.cate1,'Shopping','15 Mar 2019, 8:20 PM',120.0,spend),
                  spendingCategory(const Color(0xFF87f0ff),AssetHelper.cate3,'Sport','10 Mar 2019, 6:50 PM',99.9,spend),
                  spendingCategory(const Color(0xFFffcf87),AssetHelper.cate1,'Shopping','5 Mar 2019, 7:20 PM',255,spend),
                  spendingCategory(const Color(0xFFff8787),AssetHelper.cate4,'Travel','3 Mar 2019, 5:50 PM',399,spend),
                  spendingCategory(const Color(0xFF87f0ff),AssetHelper.cate3,'Sport','10 Feb 2019, 5:20 PM',99.1,spend),

                ],
              )
            );
          })
        ],
      ),
    );
  }
  Widget spendingCategory (color,image,title,subtitle,double amount, Function(double) onSpend){
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Image.asset(image,scale: 2),
      ),
      title: Text(title,style: TextStyles.defaultStyle.whiteTextColor.regular.setTextSize(18.sp).setFont('Montserrat')),
      subtitle: Text(subtitle,style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat').setColor(ThemeColor.subtitleColor)),
      trailing: SizedBox(
        width: 80.w,
        child: Row(
          children: [
            Text(
            '\-\$$amount',
            style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat').setColor(ThemeColor.subtitleColor)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
      onTap: (){
        onSpend(amount);
      },
    );
  }
}
