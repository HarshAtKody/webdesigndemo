import 'package:flutter/material.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  List<String> navList = ["Contacts","Reservations","Home"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
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
                    return Row(
                      children: [
                        Text(navList[index],style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    );
                  },separatorBuilder: (context,index){
                      return const SizedBox(height: 10,);
                  },),
                )

          ],
        ),
      ),
    );
  }
}
