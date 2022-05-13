import 'package:flutter/material.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Top NavBar
            Row(children: [
              Image.asset("assets/images/dash.png",height: 100,width: 150,),
              const Spacer(),
              const Text("Episode",style: TextStyle(fontSize: 18),),
              const SizedBox(width: 50,),
              const Text("About",style: TextStyle(fontSize: 18),)
            ],),

            const SizedBox(height: 100,),

            /// Body Content
            const Text('FLUTTER WEB.\nTHE BASICS', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 60),textAlign: TextAlign.center,),

            const SizedBox(height: 30,),

            const Text('In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
              style: TextStyle(fontSize: 18, height: 1.7,),
              textAlign: TextAlign.center,),
            const SizedBox(height: 100,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                width: 300,
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
