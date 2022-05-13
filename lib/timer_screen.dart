import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webdesigndemo/utils/textstyles/textstyles.dart';
import 'package:webdesigndemo/utils/theme_const.dart';
import 'package:webdesigndemo/utils/widgets/common_app_bar.dart';
import 'package:webdesigndemo/utils/widgets/common_device_configuration.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with Constant{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int counterSeconds = 100;

  late Timer counter;

  var _commentData = [];

  String nameFromPreference ="";

  TextEditingController otpCTR = TextEditingController();
  FocusNode otpFocus = FocusNode();

  ///---init----
  @override void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      getData();
      startCounter();
    });

  }

  ///---Counter Method---
  void startCounter() {
    const oneSec = Duration(seconds: 5);
    counter = Timer.periodic(oneSec, (Timer timer) {
      if (counterSeconds == 0) {
        timer.cancel();
      } else {
        getData();
        counterSeconds--;

        setCounterSeconds(counterSeconds);
      }
    },
    );
  }

  ///---- Set Counter Seconds-----
  setCounterSeconds(int seconds){
    setState(() {
      counterSeconds = seconds;
    });
    print("counterSeconds $counterSeconds");
  }



  /// get Request Function
  void getData() async{
    final SharedPreferences prefs = await _prefs;
    try{
      final response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final jsonData = jsonDecode(response.body) as List;
      print("---------------------------Api Call Done  ${jsonData[0]}--------------------------------------");
      setState((){
        _commentData = jsonData;
        prefs.setString('JsonData', jsonData[counterSeconds]['title']);


        nameFromPreference = prefs.getString('JsonData') ?? "";
        print("Data From Preferences ===>----=> ${prefs.getString('JsonData')}");
      });
    }catch (err){
      print("Error From Get $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    mobileDeviceConfiguration(context);
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        bgColor: clrPurpleContainer,
        titleColor: clrWhite,
        isBackIconWhite: true,
        title: "BackGround Activity Screen",
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            Text("Counter Seconds  $counterSeconds", style: TextStyles.txtBold20,textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            Text("Name From Preference  ===>\n$nameFromPreference", style: TextStyles.txtBold20,),
          ],
        ),
      ),
    );
  }
}
