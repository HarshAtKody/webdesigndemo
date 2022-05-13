import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:webdesigndemo/utils/textstyles/textstyles.dart';
import 'package:webdesigndemo/utils/theme_const.dart';
import 'package:webdesigndemo/utils/widgets/common_button.dart';
import '../utils/widgets/round_button.dart';

///Hive Object
var userBox = Hive.box('userBox');

///Dark Mode setup
bool isDarkMode = false;
String KEY_APP_THEME_DARK = 'key_app_theme_dark';
bool? getIsAppThemeDark() => (userBox.get(KEY_APP_THEME_DARK));

///Device Details Properties
bool getIsIOSPlatform() => Platform.isIOS;

String getDeviceType() => getIsIOSPlatform() ? "iphone" : "android";

///Get Text Style
TextStyle getTextStyle(
    {required String fontFamily,
    Color txtColor = Colors.black,
    TextDecoration txtDecoration = TextDecoration.none,
    required double fontSize,
    required FontWeight fontWeight}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: txtColor,
    decoration: txtDecoration,
  );
}

///Show Log
showLog(String str) {
  print("-> $str");
}

///Get Localize Text
String getLocalValue(String key) {
  return key.tr();
}

///Hide Keyboard
hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
///Save Local Data
saveLocalData(String key, value) {
  userBox.put(key, value);
  showLog("Saved new data into your local Key - $key Value - ${userBox.get(key)}");
}
/// For Height of Keyboard when it is Opened
SizedBox addPaddingWhenKeyboardAppears() {
  final viewInsets = EdgeInsets.fromWindowPadding(
    WidgetsBinding.instance!.window.viewInsets,
    WidgetsBinding.instance!.window.devicePixelRatio,
  );

  final bottomOffset = viewInsets.bottom;
  const hiddenKeyboard = 0.0; // Always 0 if keyboard is not opened
  final isNeedPadding = bottomOffset != hiddenKeyboard;
  return SizedBox(height: isNeedPadding ? bottomOffset : hiddenKeyboard);
}

///Set Height
double setHeight(var height) {
  return ScreenUtil().setHeight(height);
}

///Set Width
double setWidth(var width) {
  return ScreenUtil().setWidth(width);
}

///Set SP
double setSp(var fontSize) {
  return ScreenUtil().setSp(fontSize);
}

showMessageDialog(BuildContext context, String? message, Function()? didTakeAction, {bool barrierDismissible = true}) {
  return showDialog(
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Constant().clrCardBGByTheme(),
        // alignment: Alignment.center,
        child: Container(
          height: setWidth(180),
          margin: EdgeInsets.only(
              bottom: setWidth(0), left: setWidth(15), right: setWidth(15)),
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(setWidth(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Center(
                    child: Text(message??"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: setSp(14),
                            color: Constant().clrTextByTheme(),
                            fontWeight: Constant().fwRegular,
                            decoration: TextDecoration.none))),
              ),
              SizedBox(
                height: setWidth(22),
              ),
              SizedBox(
                width: 100.w,
                child: RoundButton(
                  borderRadius: 5.r,
                  label: "Key_Ok".tr(),
                  bgColor: Constant().clrWhite,
                  borderColor: Constant().clrDarkPink,
                  titleColor: Constant().clrDarkPink,
                  onTap: () {
                    Navigator.pop(context);
                    didTakeAction!();
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

///-- Date Convert---
///Get Custom String Date From DateTime With Output Format
String getCustomFormatDateFromDateTime(DateTime dateTime, String outputFormat) {
  return DateFormat(outputFormat).format(dateTime);
}

enum AdvanceBalanceEnum{
  UnknownTransactionsServiceType,
  UnknownTransactionsDate,
  UnknownTransactionsTransactionId,
  AdvanceBalanceDate,
  AdvanceBalanceSortBy,
  AdvanceBalanceTransactionId
}



/// Advanced Credit Success Dialog
advancedCreditSuccessDialog(BuildContext context,String title,String subTitle, Function() dismissBlock,
   /* {int? milliSeconds}*/) async {
  showDialog(barrierDismissible: true, context: context, builder: (context) => Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: Container(
            color: Constant().clrCardBGByTheme(),
            width:368.w,
            height: 399.h,
            child: Padding(
              padding: EdgeInsetsDirectional.all(20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  Image.asset(Constant().icSuccess,width: 84.h,height: 84.h,),
                  SizedBox(height: 30.h,),
                  Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtBold20.copyWith(fontSize:26,color: Constant().clrTextByTheme()),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtRegular16.copyWith(color: Constant().clrTextGreyByTheme()),
                  ),
                  SizedBox(height: 30.h,),
                  CommonButton(
                    label: "Okay",
                    height: 48.h,
                    width: 127.w,
                    borderRadius: 5.r,
                    onTap: (){
                      Navigator.pop(context);
                      },)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ));
  // Future.delayed(Duration(milliseconds:milliSeconds ?? 1000),(){
  //   // Navigator.pop(context);
  //   // dismissBlock();
  // });
}


requestFailedDialog(BuildContext context,String title,String subTitle, String subTitle2,Function() dismissBlock,
    /* {int? milliSeconds}*/) async {
  showDialog(barrierDismissible: true, context: context, builder: (context) => Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
          child: Container(
            color: Constant().clrCardBGByTheme(),
            width:368.w,
            height: 399.h,
            child: Padding(
              padding: EdgeInsetsDirectional.all(20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  Image.asset(Constant().icRequestFailed,width: 84.h,height: 84.h,),
                  SizedBox(height: 30.h,),
                  Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtBold20.copyWith(fontSize:22,color: Constant().clrTextByTheme()),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtRegular14.copyWith(color: Constant().clrTextGreyByTheme()),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    subTitle2,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtRegular14.copyWith(color: Constant().clrTextGreyByTheme()),
                  ),
                  SizedBox(height: 30.h,),
                  CommonButton(
                    label: "Okay",
                    height: 48.h,
                    width: 127.w,
                    isGradient: false,
                    bgColor: Constant().clrTransparent,
                    borderColor: Constant().clrGreyBg,
                    borderRadius: 5.r,
                    onTap: (){
                      Navigator.pop(context);
                    },)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ));
  // Future.delayed(Duration(milliseconds:milliSeconds ?? 1000),(){
  //   // Navigator.pop(context);
  //   // dismissBlock();
  // });
}

///Take Advance Credit Dialog
takeAdvanceCreditDialog(BuildContext context,String title,String message, Function(bool isPositive) didTakeAction, {bool? isAfterAccepted, String? subtitle,String? positiveName,String? negativeName}) {
  return showDialog(barrierDismissible: true, context: context, barrierColor: Constant().clrBlack.withOpacity(0.4),
      builder: (context) =>
          Dialog(
            backgroundColor: Constant().clrScaffoldBGByTheme(),
            insetPadding: EdgeInsets.all(16.sp),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: 368.h,
                  width: 399.w,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 25.w,end: 25.w,top: 30.h,bottom: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: (title != ""),
                          child: Column(
                            children: [
                              Text(title,
                                  textAlign: TextAlign.center,
                                  style : TextStyles.txtBold20.copyWith(fontSize: 22.sp)
                              ),
                              SizedBox(height: 18.h,),
                            ],
                          ),
                        ),
                        Text(message,
                            textAlign: TextAlign.center,
                            style : TextStyles.txtRegular14,
                        ),
                        Visibility(
                          visible: isAfterAccepted??false,
                          child: Column(
                            children: [
                              SizedBox(height: 15.h,),
                              Text(
                                  subtitle??"",
                                  textAlign: TextAlign.center,
                                  style : TextStyles.txtRegular13
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: CommonButton(
                                label: positiveName ?? "Cancel",
                                isGradient: false,
                                borderColor: Constant().clrGreyBg,
                                bgColor:  Constant().clrTransparent,
                                onTap: (){
                                  Navigator.pop(context);
                                  Future.delayed(const Duration(milliseconds: 80), () {
                                    didTakeAction(true);
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 15.w,),
                            Expanded(
                              flex: 2,
                              child: CommonButton(
                                label: negativeName ?? "Take Advanced Balance",
                                onTap: (){
                                  Navigator.pop(context);
                                  Future.delayed(const Duration(milliseconds: 80), () {
                                    didTakeAction(false);
                                  });
                                },

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
  );
}
