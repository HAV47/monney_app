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

class ConfirmTransferScreen extends StatefulWidget {
  final String amount;
  final String name;
  final String imagePath;
  static const String routeName = 'confirm_transfer_screen';

  const ConfirmTransferScreen({
    super.key,
    required this.amount,
    required this.name,
    required this.imagePath,
  });

  @override
  State<ConfirmTransferScreen> createState() => _ConfirmTransferScreenState();
}

class _ConfirmTransferScreenState extends State<ConfirmTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                gradient: Gradients.scaffoldLinear,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.w),
                    bottomRight: Radius.circular(50.w))),
            child: AppBar(
              title: Text(
                'Transaction',
                style: TextStyles.defaultStyle.bold.whiteTextColor
                    .setFont('SFProText')
                    .setTextSize(15.sp),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
          ),
          SizedBox(height: 100.w),
          Image.asset(AssetHelper.done),
          SizedBox(height: 20.w),
          SizedBox(
            width: 260.w,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'You have successfuly sent ',
                style: TextStyles.defaultStyle.regular
                    .setTextSize(18.sp)
                    .textBoldColor
                    .setFont('Montserrat'),
                children: <TextSpan>[
                  TextSpan(
                      text: '\$${widget.amount} to ',
                      style: TextStyles.defaultStyle.regular
                          .setTextSize(18.sp)
                          .textBoldColor
                          .setFont('Montserrat')),
                  TextSpan(
                      text: ' ${widget.name}!',
                      style: TextStyles.defaultStyle
                          .setFont('Montserrat')
                          .bold
                          .textBoldColor),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.w),
          Hero(tag: 'avt_transfer', child: Image.asset('${widget.imagePath}')),
          Spacer(),
          ButtonWidget(
            title: 'Execute Again',
            width: 320.w,
            height: 70.w,
            image: AssetHelper.check,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20.w),
          ButtonWidget(
              title: 'Confirmation',
              width: 320.w,
              height: 70.w,
              border: true,
              textStyle: TextStyles.defaultStyle.textBoldColor
                  .setTextSize(20.w)
                  .setFont('Montserrat'),
            onTap: () {
                    Navigator.of(context).pushNamed(MainApp.routeName);
                  },),
          SizedBox(
            height: 30.w,
          )
        ],
      ),
    );
  }
}
