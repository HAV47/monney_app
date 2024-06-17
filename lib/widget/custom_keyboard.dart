import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/extentions/text_extentions.dart';

class CustomKeyboard extends StatelessWidget {
  final Function() onTap;
  final ValueChanged<String> onKeyTap;


  CustomKeyboard({required this.onKeyTap, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow(['.', '0', 'Enter']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> chars) {
    return SizedBox(width: 280.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: chars.map((char) {
          return _buildKey(char);
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String char) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (char == 'Enter') {
            onTap();
          } else  {
            onKeyTap(char);
          }
        },
        child: Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6FA),
            borderRadius: BorderRadius.circular(17),
            // border: Border.all(color: Colors.black26),
          ),
          child: Center(
            child: Text(
              char,
              style: TextStyles.defaultStyle.textBoldColor.medium.setTextSize(24.sp).setFont('SFProText'),
            ),
          ),
        ),
      ),
    );
  }
}