import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../textstyles/textstyles.dart';
import '../theme_const.dart';

class CommonAppBar extends ConsumerWidget
    with Constant
    implements PreferredSizeWidget {
  String title;
  String subTitle;
  Function()? onPress;
  bool isTitleCenter = true;
  bool isLeading = true;
  bool isDrawer = false;
  bool isDrawerIconWhite = false;
  bool isBackIconWhite = false;
  bool isAppIconWhite = false;
  bool isCenterWidget = false;
  bool isCenterLocation = false;
  final List<Widget>? action;
  final AppBar appBar;
  final Color? bgColor;
  final Color? titleColor;
  final Color? subTitleColor;
  final Widget? centerWidget;

  CommonAppBar({
    Key? key,
    required this.appBar,
    required this.title,
    this.subTitle = "",
    this.onPress,
    this.isTitleCenter = true,
    this.isLeading = true,
    this.isDrawer = false,
    this.isCenterWidget = false,
    this.action,
    this.isDrawerIconWhite = false,
    this.isBackIconWhite = false,
    this.isAppIconWhite = false,
    this.isCenterLocation = false,
    this.bgColor,
    this.titleColor,
    this.subTitleColor,
    this.centerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final addressWatch = ref.watch(addAddressProvider);
    return AppBar(
      toolbarHeight: 200.h,
      centerTitle: isTitleCenter,
      //brightness: Platform.isIOS ? Brightness.light : null,
      leading: isLeading
          ? IconButton(
              // icon: Icon((getAppLanguage() == "ar") ? Icons.chevron_right_rounded : Icons.chevron_left_rounded, color: Colors.black, size: 48.h,),
              icon: Image.asset(
                icBackArrow,
                color: isBackIconWhite ? clrScaffoldBGByTheme() : clrPrimary,
              ),
              onPressed: onPress ??
                  () {
                    Navigator.pop(context);
                  })
          : const Offstage(),
      elevation: 0,
      actions: action,
      // backgroundColor: clrTextByScaffoldTheme(),
      backgroundColor: bgColor,
      title: isCenterWidget
          ? centerWidget
          : isCenterLocation
              ? InkWell(
                  onTap: () {
                    // Route route = SlideRightPageRoute(builder: (context) => const SelectLocationScreen(), settings: const RouteSettings());
                    // Navigator.of(context).push(route);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Image.asset(icLocation),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "Key_Location".tr(),
                            style: TextStyles.txtRegular14
                                .copyWith(color: clrTextGreyByTheme()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // Text(addressWatch.selectedAddress?? getSelectedAddress(),
                      // Text(
                      //   getSelectedAddress(),
                      //   style: TextStyles.txtRegular20,
                      // )
                    ],
                  ),
                )
              : subTitle != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.txtSemiBold18.copyWith(
                            color: titleColor ?? clrTextMainFontByTheme(),
                          ),
                        ),
                        Text(
                          subTitle,
                          style: TextStyles.txtRegular12.copyWith(
                            color: subTitleColor ?? clrTextMainFontByTheme(),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: TextStyles.txtSemiBold18.copyWith(
                        color: titleColor ?? clrTextMainFontByTheme(),
                      ),
                    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
