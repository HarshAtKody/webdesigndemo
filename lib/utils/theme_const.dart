// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const.dart';

/*
  * -- Enum (DO NOT MAKE CHANGES)
  * */

class Constant {
  String appName = "Getsy vendor";
  static const String active_app_language = 'ApplicationLanguage';

/*
  * -- Dimen
  * */
  double infiniteSize = double.infinity;

  /*
  * -- Time Formate
  * */
  String str12Hr = "hh:mm a";
  String str24Hr = "hh:mm:ss";

  ///App Language
  String langAR = "ar";
  String langEN = "en";

  /// Currency
  String currency = "₹";

  /*
  * ------------------------ Colors ----------------------------------------- *
  * */
  MaterialColor colorPrimary = MaterialColor(0xffF6253B, colorSwathes);

  static Map<int, Color> colorSwathes = {
    50: const Color.fromRGBO(38, 185, 223, .1),
    100: const Color.fromRGBO(38, 185, 223, .2),
    200: const Color.fromRGBO(38, 185, 223, .3),
    300: const Color.fromRGBO(38, 185, 223, .4),
    400: const Color.fromRGBO(38, 185, 223, .5),
    500: const Color.fromRGBO(38, 185, 223, .6),
    600: const Color.fromRGBO(38, 185, 223, .7),
    700: const Color.fromRGBO(38, 185, 223, .8),
    800: const Color.fromRGBO(38, 185, 223, .9),
    900: const Color.fromRGBO(38, 185, 223, 1),
  };

  Color clrPrimary = const Color(0xff000000);
  Color clrBlack = const Color(0xff000000);
  Color clrTransparent = const Color(0x00000000);
  Color clrNearWhite = const Color(0xffF2F6FA);
  Color clrWhite = const Color(0xffFFFFFF);
  Color clrBorder = const Color(0xff979797);
  Color clrTextGrey = const Color(0xff6B6B6B);
  Color clrTextGreyLight = const Color(0xff8E8E8E);
  Color clrBGGrey = const Color(0xffBCBCBC);
  Color clrGreyLight = const Color(0xffB1B1B1);
  Color clrBGGreyLight = const Color(0xffF9F9F9);
  Color clrBorderGrey = const Color(0xffC7C7C7);
  Color clrGreen = const Color(0xff25AE72);
  Color clrTealGreen = const Color(0xff6AA045);
  Color clrGreenLight = const Color(0xff1FA47B);
  Color clrBGGreenLight = const Color(0xffF2FDFB);
  Color clrRed = const Color(0xffEC1C23);
  Color clrDarkGrey = const Color(0xff4E4E4E);
  Color clrLightGrey = const Color(0xffCFCFCF);
  Color clrDivider = const Color(0xffC9C9C9);
  Color clrPurple = const Color(0xff293897);
  Color clrOrange = const Color(0xffFFA200);
  Color clrOrangeLight = const Color(0xffFCF8F2);
  Color clrBlue = const Color(0xff0C84C2);
  Color clrBGBlueLight = const Color(0xffF2F9FC);
  Color clrPink = const Color(0xffD2456B);
  Color clrPinkLight = const Color(0xffCF5576);
  Color clrBrown = const Color(0xff76512D);
  Color clrBrownLight = const Color(0xff707070);
  Color clrPurpleLight = const Color(0xff911AEB);
  Color clrPurpleDark = const Color(0xff000B43);
  Color clrDarkRed = const Color(0xffDE2427);
  Color clrWhiteBg = const Color(0xffF2F2F2);

  Color clrGreyBg = const Color(0xffEEEEEE);
  Color clrGreyWhite = const Color(0xffF8F8F8);

  Color clrLightBlueGradient = const Color(0xff1DD8FF);
  Color clrBlueGradient = const Color(0xff3CC3DF);
  Color clrDarkBlueGradient = const Color(0xff00BCEC);
  Color clrTextDarkGrey = const Color(0xff1E1E1E);
  Color clrPurpleContainer = const Color(0xff293897);
  Color clrNearlyWhite = const Color(0xffEDEDFE);
  Color clrLightPurple = const Color(0xFF4050B6);
  Color clrcloseIconColorGrey = const Color(0xFF929292);
  Color clrLightGreen = const Color(0xFFF3FBFC);
  Color clrLightOrange = const Color(0xFFFCF3F3);
  Color clrTextOrange = const Color(0xFFFCAB10);


  ///DarkMode Color
  ///------------- Dark Mode setup Start---------------///
  Color clrTextByTheme() => isDarkMode ? clrWhiteNew : clrBlackNew;

  Color clrTextMainFontByTheme() => isDarkMode ? clrWhiteNew : Color(clrFont);

  Color clrTextGreyByTheme() =>
      isDarkMode ? clrLightGreyNew : Color(clrFontGrey);

  Color clrTextDarkGreyByTheme() =>
      isDarkMode ? clrLightGreyNew : clrDarkGreyNew;

  Color clrTabBGByTheme() => isDarkMode ? clrTextGrey : clrLightGreyNew;

  Color clrTextByScaffoldTheme() => isDarkMode ? clrBlackNew : clrWhiteNew;

  Color clrScaffoldBGByTheme() => isDarkMode ? clrScaffoldBGNew : clrWhiteNew;

  Color clrONBoardingScaffoldBGByTheme() =>
      isDarkMode ? clrScaffoldBGNew : clrBGGreyLight;

  Color clrCardBGByTheme() => isDarkMode ? clrDarkGreyNew : clrWhiteNew;

  Color clrSnackBarBGByTheme() => isDarkMode ? clrDarkGreyNew : clrBlackNew;

  Color clrBlurByTheme() =>
      isDarkMode ? clrBlack.withOpacity(0.9) : clrGreyBg.withOpacity(0.9);

  Color clrBGGreyDarkByTheme() => isDarkMode ? clrWhite : clrGreyBg;

  Color clrDialogBGByTheme() =>
      (isDarkMode ? clrWhite : clrBlack).withOpacity(0.3);

  // Color clrTextBlueByTheme() => isDarkMode ? clrWhiteNew : clr;
  // Color clrIconByTheme() => isDarkMode ? clrWhiteNew : clrTextBlue;
  // Color clrDialogBGByTheme() => (isDarkMode ? clrWhiteNew : clrBlackNew).withOpacity(0.3);
  // Color clrDialogBGByTheme() => (isDarkMode ? clrDarkDialog :clrWhite);

  Color clrBlackNew = const Color(0xff000000);
  Color clrWhiteNew = const Color(0xffFFFFFF);
  Color clrDarkPink = const Color(0xffFF385C);
  Color clrMainFontNew = const Color(0xff010101);
  Color clrLightGreyNew = const Color(0xff8A8A8A);
  Color clrDarkGreyNew = const Color(0xff292929);
  Color clrScaffoldBGNew = const Color(0xff191919);

  int clrFont = 0xff333333;
  int clrFontGrey = 0xff989898;

/*
  * ------------------------ FontStyle ----------------------------------------- *
  * */
  String fontFamily = "Roboto UI";

  FontWeight fwThin = FontWeight.w100;
  FontWeight fwExtraLight = FontWeight.w200;
  FontWeight fwLight = FontWeight.w300;
  FontWeight fwRegular = FontWeight.w400;
  FontWeight fwMedium = FontWeight.w500;
  FontWeight fwSemiBold = FontWeight.w600;
  FontWeight fwBold = FontWeight.w700;
  FontWeight fwExtraBold = FontWeight.w800;

/*
  * ------------------------ Texts ----------------------------------------- *
  * */

/*
 * ----------------------------- Images---------------------------------------- *
 */

  static String assets = 'assets/images/';

  //splash
  String icSplash = assets + 'report_card.png';

  /// Banner
  String icBanner1 = assets + 'banner1.png';
  String icBanner2 = assets + 'banner2.png';

  /// Share
  String icWhatsApp = assets + "ic_whatsapp.png";
  String icFacebook = assets + "ic_facebook.png";
  String icShare = assets + "ic_share.png";

  String icMore = assets + "ic_more.png";
  String icYoutube = assets + "ic_youtube.png";

  /// Check
  String icCheck = assets + "ic_check.png";

  String icBackArrowShare = assets + 'back-arrow.png';

  //login
  String icBackArrow = assets + 'ic_back.png';

  /// Advance Balance
  String icSpiceMoney = assets + "ic_spice_money.png";
  String icWallet = assets + "ic_wallet.png";
  String icDownArrow = assets + "ic_down_arrow.png";

  String icRupees = assets + "ic_rupees.png";
  String icFilter = assets + "ic_filter.png";
  String icRupeesYellow = assets + "rupee_illustration.png";
  String icWalletBlue = assets + "ic_wallet_blue.png";
  String icRequestFailed = assets + "ic_request_failed.png";
  String icSuccess = assets + "ic_success.png";
  String icBank = assets + "ic_bank.png";


}

enum enum_AddressSaveAS { Home, Office, Custom }

const Map<enum_AddressSaveAS, String> enum_AddressSaveASNames = {
  enum_AddressSaveAS.Home: "Home",
  enum_AddressSaveAS.Office: "Office",
  enum_AddressSaveAS.Custom: "Custom",
};

///enum for  filter
enum enumOfferDetail { fromStoreSalonArtist, fromAll }
