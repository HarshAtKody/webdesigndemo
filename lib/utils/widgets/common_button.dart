import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../textstyles/textstyles.dart';
import '../theme_const.dart';

class CommonButton extends StatelessWidget with Constant {
  final String label;
  final Function()? onTap;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final bool isEnable;
  final double? padding;
  final double? borderHeight;
  final String image;
  final bool isImageAlignRight;
  final TextStyle? textStyle;
  final bool isGradient;

  CommonButton(
      {Key? key,
        required this.label,
        required this.onTap,
        this.textColor,
        this.bgColor,
        this.borderColor,
        this.borderRadius,
        this.height,
        this.width,
        this.padding,
        this.isEnable = true,
        this.borderHeight,
        this.image = "",
        this.isImageAlignRight = true,
        this.textStyle,
        this.isGradient = true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??48.h,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: isEnable?onTap:null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                side: isGradient ? BorderSide.none : BorderSide(
                    color: (isEnable) ? borderColor ?? clrPrimary : Colors.grey,
                    width: (borderHeight ?? 1)
                )
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(!isEnable ? clrTextGrey : bgColor ?? clrPrimary),
        ),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: (isEnable && isGradient) ? [clrPurpleContainer, clrLightPurple] : (isEnable && !isGradient) ? [(bgColor ?? clrWhite), bgColor ?? clrWhite] : [clrGreyLight, clrTextGrey],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r)
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: width ?? 130.w, minHeight: 50.h),
            alignment: Alignment.center,
            child: (image == "") ? Text(
              label,
              textAlign: TextAlign.center,
              style: textStyle ?? TextStyles.txtMedium16.copyWith(color: textColor ?? ((isGradient) ? clrWhite : clrPrimary)),
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isImageAlignRight ? Container(padding: EdgeInsets.symmetric(horizontal: 8.w),child: Image.asset(image)) : Container(width: 0,),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: textStyle ?? TextStyles.txtRegular16.copyWith(color: textColor ?? clrWhite),
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

/*
Widget Usage

CommonButton(
            label: "Login",
            onTap: () {}
        )

*/
