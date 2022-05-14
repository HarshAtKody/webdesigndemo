import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webdesigndemo/utils/textstyles/textstyles.dart';
import 'package:webdesigndemo/utils/theme_const.dart';
import 'package:webdesigndemo/utils/widgets/common_button.dart';
import 'package:webdesigndemo/utils/widgets/common_device_configuration.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> with Constant{
  List<String> navList = ["Contacts","Reservations","Home"];


  @override
  Widget build(BuildContext context) {
    mobileDeviceConfiguration(context);
    return Scaffold(
      backgroundColor: const Color(0xfff3f0f0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) => // Ensure Scaffold is in context
          IconButton(icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () => Scaffold.of(context).openDrawer()),),
        title: Row(
          children: [
             Image.asset("assets/images/helmat.png",height: 40,width: 40,),
             const Text("VespaJoy",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),)
          ],),
        actions: const[
          Icon(Icons.perm_identity,color: Colors.black,),
          SizedBox(width: 10,),
          Icon(Icons.notifications_none,color: Colors.black,),
          SizedBox(width: 10,),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.amberAccent.withOpacity(0.8),
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text("Vespa Joy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22)
                ),
              ),
            ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                    itemCount: navList.length,
                      itemBuilder:  (context,index) {
                    return InkWell(
                      onTap: (){
                      },
                      child: Row(
                        children: [
                          Text(navList[index],style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    );
                  },separatorBuilder: (context,index){
                      return const SizedBox(height: 10,);
                  },),
                )
          ],
        ),
      ),
      body: bodyWidget(),
    );
  }

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',

  ];


  Widget bodyWidget(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/scooter.png",height: 300.h,width: 300.h,)),
            SizedBox(height: 20.h,),
            const Text("Ride in style",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            SizedBox(height: 20.h,),
            const Text("Rent a Vespa at any VespaJoy location across Canada and enjoy unlimited kilometres!",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
            SizedBox(height: 20.h,),
            CommonButton(
                borderRadius: 30.r,
                padding: 20.sp,
                isGradient: false,
                borderColor: clrTransparent,
                label: "Rent A Vespa Now",
                onTap: (){
                  Navigator.pushNamed(context,'/backgroundWorkingDemo');
                }),


            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                style: TextStyles.txtBold14.copyWith(color: clrPurpleContainer),
                customButton: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset("assets/images/ic_back.png"),
                  ),
                  Text(selectedValue??"Product"),
                ],
                ),
                hint: Text("Product",style: TextStyles.txtRegular17.copyWith(color: clrPurpleContainer),),
                icon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset("assets/images/ic_back.png"),
                ),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:44.h,
                          decoration: BoxDecoration(color: selectedValue == value? const Color(0xff008080).withOpacity(0.1): clrTransparent),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(value, style: TextStyles.txtMedium16.copyWith(color: Color(0xff008080), fontSize: 10.sp)),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: clrPurpleContainer,height: 0.2,),

                      ],
                    ),
                  );
                }).toList(),
                isExpanded: true,
                onChanged: (value) {
                 setState(() {
                   selectedValue = value;
                 });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
