import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/constants/model/argument_transfer_model.dart';
import 'package:monneyapp/screen/tranfer/confirm_tranfer_screen.dart';
import 'package:monneyapp/widget/custom_keyboard.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  static const String routeName = 'transfer_screen';

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final String name = 'Grace Addison';

  void _onKeyTap(String value) {
    setState(() {
      _controller.text = _controller.text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  'Transfer',
                  style: TextStyles.defaultStyle.bold.whiteTextColor
                      .setFont('SFProText')
                      .setTextSize(15.sp),
                ),
                backgroundColor: Colors.transparent,
                centerTitle: true,
              ),
            ),
            SizedBox(
              height: 90.w,
            ),
            Text(
              'Enter Amout',
              style: TextStyles.defaultStyle.regular.textBoldColor
                  .setFont('Montserrat'),
            ),
            SizedBox(
              width: 220.w,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  prefix: Text(
                    '\$',
                    style: TextStyles.defaultStyle.textBoldColor.bold
                        .setTextSize(36.sp)
                        .setFont('Montserrat'),
                  ),
                  hintText: '0',
                  hintStyle: TextStyles.defaultStyle.bold
                      .setTextSize(36.sp)
                      .setFont('Montserrat')
                      .setColor(ThemeColor.textBoldColor.withOpacity(0.2)),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            SizedBox(height: 20.w),
            SizedBox(
              width: 170.w,
              child: Row(
                children: [
                  Hero(
                    tag: 'avt_transfer',
                    child: Image.asset(
                      AssetHelper.avtTransfer,
                      scale: 2,
                    ),
                  ),
                  Text(
                    '$name',
                    style: TextStyles.defaultStyle.regular
                        .setFont('Montserrat')
                        .setTextSize(16.sp),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.w),
            CustomKeyboard(
              onKeyTap: _onKeyTap,
              onTap: () => Navigator.pushNamed(context, ConfirmTransferScreen.routeName,arguments: TransferArguments(name: name,amount: _controller.text,imagePath : AssetHelper.avtTransfer),)
            ),
          ],
        ),
      ),
    );
  }
}
