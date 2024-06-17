import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.onTap, this.image,this.iconData, required this.width, required this.height, this.textStyle,  this.border, this.color,this.colorIcon});
  final String title;
  final Function()? onTap;
  final String? image;
  final IconData? iconData;
  final TextStyle? textStyle;
  final double width,height;
  final bool? border;
  final Color? color,colorIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: color != null ? color: null,
            borderRadius: BorderRadius.circular(30.w),
            border: Border.all(color: border == true ? Colors.black : Colors.white),
            image: image != null ? DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.cover
            ) : null
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ?? TextStyles.defaultStyle.whiteTextColor.setTextSize(20.w).setFont('Montserrat') ,textAlign: TextAlign.center,
            ),
            iconData != null ? Spacer() :SizedBox(),
            iconData != null ? Icon(iconData ,color: colorIcon ?? CupertinoColors.white,size: 24):SizedBox(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}