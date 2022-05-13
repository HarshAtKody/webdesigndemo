
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_const.dart';

class RoundButton extends StatelessWidget with Constant {

  final String label;
  final Function()? onTap;
  final double? fontSize;
  final double? maxHeight;
  final double? minWidth;
  final Color? bgColor;
  final Color? titleColor;
  final bool isEnable;
  final Color borderColor;
  final String image;
  final bool isImageAlignRight;
  final double? borderRadius;

  RoundButton({
    Key? key,
    this.label = "",
    this.onTap,
    this.fontSize,
    this.maxHeight,
    this.minWidth,
    this.bgColor,
    this.titleColor,
    this.isEnable = true,
    this.borderColor = Colors.transparent,
    this.image = "",
    this.isImageAlignRight = true,
    this.borderRadius
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = maxHeight??46;
    double radius = borderRadius ?? (height/2).h;


    return SizedBox(
      height: height.h,
      // width: minWidth??130.w,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: (isEnable) ? onTap : null,
        shape: RoundedRectangleBorder(side: BorderSide(
            color: borderColor,
            width: 1,
            style: BorderStyle.solid
        ), borderRadius: BorderRadius.circular(radius)),
        padding: const EdgeInsets.all(0.0),
        // splashColor: Color(clrLightPinkGradient),
        child: Ink(
          decoration: BoxDecoration(
              color: (bgColor ?? clrDarkPink).withOpacity((isEnable ? 1.0 : 0.5)),
              borderRadius: BorderRadius.circular(radius)
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: minWidth??130.w, minHeight: 50.h),
            alignment: Alignment.center,
            child: (image == "")? Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize??16.sp,
                  color: titleColor ?? clrWhite,
                  fontWeight: fwRegular
              ),
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isImageAlignRight ? Container(padding: EdgeInsets.symmetric(horizontal: 8.w),child: Image.asset(image)) : Container(width: 0,),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: fontSize??16.sp,
                      color: titleColor ?? clrWhite,
                      fontWeight: fwRegular
                  ),
                ),
                isImageAlignRight ? Container(padding: EdgeInsets.symmetric(horizontal: 8.w),child: Image.asset(image)) : Container(width: 0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Usage
/*
RoundButton(
              label: getLocalValue(context, "Key_LogInRegister"),
              onTap: () {
              },
            ),
///For Border Button
RoundButton(
                                    label: getLocalValue(context, "Key_Decline"),
                                    bgColor: clrWhite,
                                    borderColor: clrDarkPink,
                                    titleColor: clrDarkPink,
                                    onTap: () {
                                    },
                                  )
*/