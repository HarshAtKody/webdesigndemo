import 'package:flutter/material.dart';
import 'package:webdesigndemo/utils/widgets/common_device_configuration.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mobileDeviceConfiguration(context);
    return Scaffold(
      backgroundColor: const Color(0xffE8F9FD),
      appBar: AppBar(
          leading: Builder(builder: (context) => // Ensure Scaffold is in context
          IconButton(icon: const Icon(Icons.menu,color: Colors.black,),
              onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Humming \nBird.".toUpperCase(),style: const TextStyle(fontSize: 16,color: Colors.black),),
            ),
          ]
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  SizedBox(height: 40,),
                  Text("SKILL UP NOW", style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w800),),
                  Text("TAP HERE", style: TextStyle(fontSize: 14,color: Colors.white),),
                  SizedBox(height: 30,),
                  Align(alignment: Alignment.bottomRight,child: Icon(Icons.arrow_right, color: Colors.white,size: 34,))
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Icon(Icons.video_settings),
                      SizedBox(width:10,),
                      Text("Episode",style: TextStyle(fontSize: 14),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const[
                      Icon(Icons.message_outlined),
                      SizedBox(width:10,),
                      Text("About",style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),

            /// Body Content
            const Text('FLUTTER WEB.', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 35),),
            const Text('THE BASICS', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 35),),

            const SizedBox(height: 20,),

            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                style: TextStyle(fontSize: 16, height: 1.7,),
                textAlign: TextAlign.center,),
            ),

            const SizedBox(height: 40,),

            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),

                child: const Center(child: Text("Join Course",style: TextStyle(fontSize: 18,color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
