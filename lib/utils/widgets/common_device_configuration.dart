import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


  mobileDeviceConfiguration(BuildContext context) {
  return ScreenUtil.init(context, designSize: const Size(414, 788));
}


  webDeviceConfiguration(BuildContext context) {
  return ScreenUtil.init(context, designSize: const Size(1366, 768));
}
