import 'package:flutter/material.dart';

class LoginScreenTablet extends StatelessWidget {
  const LoginScreenTablet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8F9FD),
      appBar: AppBar(
        title: const Text("SignUp Screen",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),
      ),
      body: bodyWidget(context),
    );
  }




  /// Body Widget
  Widget bodyWidget(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/dash.png",)),

            const SizedBox(height: 20,),
            const Text("DASH - The Humming Bird",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 22),),
            const SizedBox(height: 20,),
            const Text("Sign up To Continue...",style: TextStyle(color: Colors.black,fontSize: 18),),
            Container(
              color: Colors.white,
              width: 2,
            ),
            const SizedBox(height: 10,),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                labelStyle: TextStyle(color: Colors.black,),
                labelText: 'Username',

              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                labelStyle: TextStyle(color: Colors.black,),
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                labelStyle: TextStyle(color: Colors.black,),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_month),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                labelStyle: TextStyle(color: Colors.black,),
                labelText: 'DD-MM-YYYY',
              ),
            ),
            const SizedBox(height: 60,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: const Center(child: Text("Cancel")) ,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false,);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: const Center(child: Text("Create Account")) ,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}