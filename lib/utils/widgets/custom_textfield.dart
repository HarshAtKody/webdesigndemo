import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_const.dart';

class CustomTextField extends StatelessWidget with Constant {
  BuildContext context;
  TextEditingController? myController;
  ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  GestureTapCallback? onTap;
  String? placeHolderMessage;
  String? errorMessage;
  bool obscureText;
  double? fontSize;
  bool enable;
  bool isBottomAlignment;
  FocusNode? myFocus;
  int? maxLine;
  double? height;
  Widget? preFix;
  String? hintText;
  bool? isUnderLine;

  CustomTextField({
    required this.context,
    required this.myController,
    this.onChanged,
    this.fontSize,
    this.textInputType,
    this.textInputAction,
    this.isBottomAlignment = false,
    this.placeHolderMessage = "",
    this.errorMessage = "",
    this.obscureText = false,
    this.enable = true,
    this.inputFormatters,
    this.myFocus,
    this.onTap,
    this.maxLine,
    this.height,
    this.preFix,
    this.hintText,
    this.isUnderLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 60.h,
          margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w),
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: clrPurpleContainer, width: 3.w)),
          alignment:
              isBottomAlignment ? Alignment.bottomCenter : Alignment.center,
          child: TextFormField(
            maxLines: maxLine ?? 1,
            enabled: enable,
            onTap: onTap,
            controller: myController,
            onChanged: onChanged,
            focusNode: myFocus,
            cursorColor: clrTextByTheme(),
            obscureText: obscureText,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            style: TextStyle(
                fontSize: fontSize ?? 14.sp,
                color: (enable) ? clrTextByTheme() : clrTextGreyByTheme(),
                fontWeight: fwSemiBold,
                fontFamily: fontFamily),
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
                hintText: hintText,
                isDense: true,
                contentPadding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(1), top: 6.h, bottom: 8.h),
                prefix: preFix,
                labelText: placeHolderMessage,
                hintStyle: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 12.sp,
                    color: clrWhite,
                    fontWeight: fwRegular),
                labelStyle: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 14.sp,
                    color: clrWhite,
                    fontWeight: fwRegular),
                errorStyle: TextStyle(color: clrTextByTheme()),
                focusedBorder: isUnderLine == true
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: clrPrimary),
                      )
                    : InputBorder.none,
                disabledBorder: isUnderLine == true
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: clrTextGreyByTheme()))
                    : InputBorder.none,
                enabledBorder: isUnderLine == true
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: clrTextGreyByTheme()))
                    : InputBorder.none,
                border: isUnderLine == true
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: clrPrimary))
                    : InputBorder.none
                // border: InputBorder.none
                ),
          ),
        ),
        (errorMessage != null && errorMessage != "")
            ? Padding(
                padding: EdgeInsets.fromLTRB(0.w, 6.h, 0.w, 6.h),
                child: Text(
                  errorMessage ?? "",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: clrRed,
                      fontFamily: fontFamily,
                      fontWeight: fwRegular),
                ),
              )
            : Container()
      ],
    );
  }
}

/* Usage
CustomTextField(
                  context: context,
                  placeHolderMessage: "Name",
                  errorMessage: "Please Enter Name.\nPlease Enter Name.",
                  // mycontroller: emailController,
                  // myfocus: emailFocus,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (str) {

                  },
                ),
*/

class CustomTextFormField extends StatelessWidget with Constant {
  CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      required this.focusNode,
      this.minLines,
      this.maxLines,
      this.textCapitalization,
      required this.textStyle,
      this.textInputType,
      this.hintText,
      this.hintStyle,
      this.isBorder = true,
      this.onChanged,
      this.isUnderLine = false,
      this.enabled = true})
      : super(key: key);
  final TextEditingController textEditingController;
  ValueChanged<String>? onChanged;
  final FocusNode focusNode;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final TextStyle textStyle;
  final TextInputType? textInputType;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? isBorder;
  final bool? isUnderLine;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      minLines: minLines ?? 1,
      focusNode: focusNode,
      cursorColor: clrBlack,
      maxLines: maxLines ?? 1,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      style: textStyle,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChanged,
      enabled: enabled,
      decoration: InputDecoration(
          hintText: "$hintText",
          hintStyle: hintStyle,
          isDense: true,
          contentPadding: EdgeInsets.only(
              left: ScreenUtil().setWidth(1), top: 6.h, bottom: 8.h),
          focusedBorder: isUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: clrPrimary),
                )
              : InputBorder.none,
          disabledBorder: isUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: clrTextGreyByTheme()))
              : InputBorder.none,
          enabledBorder: isUnderLine == true
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: clrTextGreyByTheme()))
              : InputBorder.none,
          border: isUnderLine == true
              ? UnderlineInputBorder(borderSide: BorderSide(color: clrPrimary))
              : InputBorder.none
          // border: InputBorder.none
          ),
    );
  }
}
