import 'package:flutter/material.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text('FLUTTER WEB.\nTHE BASICS', style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),),

                      SizedBox(height: 30,),

                      Text('In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                          style: TextStyle(fontSize: 21, height: 1.7,))
                    ],
                  ),
                ),
                const SizedBox(width: 200,),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),

                      child: const Center(child: Text("Join Course",style: TextStyle(fontSize: 18,color: Colors.white),)),
                    ),
                  ),
                ),

                const SizedBox(width: 200,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
