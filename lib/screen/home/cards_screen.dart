import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/constants/model/card_model.dart';
import 'package:monneyapp/widget/shared_preferences_util_widget.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  static const String routeName = 'cards_screen';

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  double balance = 4500.00;

  late List<CardModel> list = [
    CardModel(
      image: AssetHelper.card,
      balance: balance,
      title: 'Company',
      date: '01/2020',
      number: '**** **** **** 2204',
    ),
    CardModel(
      image: AssetHelper.card2,
      balance: balance,
      title: 'Home',
      date: '01/2020',
      number: '**** **** **** 2204',
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBalance();
  }

  void loadBalance() async {
    double storedBalance = await SharedPreferencesUtil.getBalance();
    setState(() {
      balance = storedBalance;
      initializeList();
    });
  }

  void initializeList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: Gradients.scaffoldLinear,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70.w),
                  bottomRight: Radius.circular(70.w)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.w),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ThemeColor.white,
                      size: 24,
                    )),
                SizedBox(height: 20.w),
                SizedBox(
                    width: 260.w,
                    child: Text(
                      'You can check your cards here.',
                      style: TextStyles.defaultStyle.bold
                          .setFont('MontserratBold')
                          .setTextSize(24.sp)
                          .setColor(ThemeColor.white),
                    )),
                Container(
                  color: Colors.transparent,
                  height: 300.w,
                  child: Align(
                    child: Swiper(
                      viewportFraction: 0.65,
                      fade: 1,
                      scale: 0.7,
                      loop: false,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        bool isCard2 = list[index].image == AssetHelper.card2;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.w),
                            image: DecorationImage(
                              image: AssetImage('${list[index].image}',),fit: BoxFit.cover
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.w),
                              Text('\$${list[index].balance}',style: TextStyles
                                  .defaultStyle.bold.setFont('MontserratBold').setTextSize(24.sp).setColor(isCard2 ? Colors.black : Colors.white)),
                              SizedBox(height: 10.w),
                              Text('${list[index].title}',
                                  style: TextStyles
                                      .defaultStyle.bold.setFont('MontserratBold').setTextSize(18.sp).setColor(isCard2 ? Colors.black : Colors.white)),
                              const Spacer(),
                              Text(
                                '${list[index].date}',
                                  style: TextStyles
                                      .defaultStyle.setFont('Montserrat').setTextSize(12.sp).setColor(isCard2 ? Colors.black : Colors.white)),
                              Text('${list[index].number}', style: TextStyles
                                  .defaultStyle.setFont('Montserrat').setTextSize(14.sp).setColor(isCard2 ? Colors.black : Colors.white)),
                              SizedBox(height: 30.w,)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                Text('Recent Transactions',
                    style: TextStyles.defaultStyle.bold
                        .setTextSize(22.sp)
                        .setFont('MontserratBold')),
                spendingCategory(const Color(0xFFffcf87), AssetHelper.cate1,
                    'Shopping', '15 Mar 2019, 8:20 PM', 120),
                spendingCategory(const Color(0xFFe09fff), AssetHelper.cate2,
                    'Medicine', '13 Mar 2019, 12:10 AM', 89.5),
                spendingCategory(const Color(0xFF87f0ff), AssetHelper.cate3,
                    'Sport', '10 Mar 2019, 6:50 PM', 99.9),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget spendingCategory(color, image, title, subtitle, double amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Image.asset(image, scale: 2),
      ),
      title: Text(title,
          style: TextStyles.defaultStyle
              .setColor(Colors.black)
              .regular
              .setTextSize(18.sp)
              .setFont('Montserrat')),
      subtitle: Text(subtitle,
          style: TextStyles.defaultStyle.regular
              .setTextSize(14.sp)
              .setFont('Montserrat')
              .setColor(ThemeColor.grey)),
      trailing: SizedBox(
        width: 80.w,
        child: Row(
          children: [
            Text('\-\$$amount',
                style: TextStyles.defaultStyle.regular
                    .setTextSize(14.sp)
                    .setFont('Montserrat')
                    .setColor(Colors.black)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
