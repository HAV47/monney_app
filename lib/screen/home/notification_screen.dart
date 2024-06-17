import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 50.w),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF5F6FA),
                  focusColor: Color(0xffF5F6FA),
                  hintText: 'Search',
                  hintStyle: TextStyles.defaultStyle.textBoldColor.regular.setTextSize(18.sp).setFont('SfProDisplayLight'),
                  prefixIcon: Icon(Icons.search,color: ThemeColor.iconColor,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.w),
              SizedBox(width : 300.w,
                  child: Text('You can check your notificaions here.',style: TextStyles.defaultStyle.bold.setFont('MontserratBold').setTextSize(22.sp))),
              notification(AssetHelper.noti1, 'Arlene Fox', 'Arlene just sent you \$20.'),
              notification(AssetHelper.noti2, 'Theresa Webb', 'Theresa sent you \$99.'),
              notification(AssetHelper.noti3, 'Marvin Murphy', 'Marvin sent you \$500.'),
              notification(AssetHelper.noti4, 'Bessie Alexander', 'Bessie sent you \$25.'),
              notification(AssetHelper.noti5, 'Ronald Robertson', 'Ronald sent you \$10.'),
              notification(AssetHelper.noti6, 'Darrell Mckinney', 'Darrell sent you \$12.'),
              notification(AssetHelper.noti7, 'Gregory Bell', 'Gregory sent you \$25.'),

            ],
          ),
        ),
      ),
    );
  }
  Widget notification (image ,title ,subtitle){
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(image),
        radius: 30,
      ),
        // child: Image.asset(image,height: ,)),
      title: Text(title,style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat').setColor(Colors.black)),
      subtitle: Text(subtitle,style: TextStyles.defaultStyle.regular.setTextSize(14.sp).setFont('Montserrat').textBoldColor),
      trailing: Icon(Icons.arrow_forward_ios,size: 20.sp,color: ThemeColor.textBoldColor),
      contentPadding: EdgeInsets.symmetric(horizontal: 0),

    );
  }
}
