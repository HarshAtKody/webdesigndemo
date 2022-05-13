import 'package:flutter/material.dart';
import 'package:webdesigndemo/utils/widgets/common_device_configuration.dart';

class LoginScreenDesktop extends StatelessWidget {
  const LoginScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    webDeviceConfiguration(context);
    return Scaffold(
      body: bodyWidget(context),
    );
  }


  /// Body Widget
  Widget bodyWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE8F9FD),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [

                  ClipRRect(
                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(20)),
                      child: Image.asset("assets/images/dash.png",)),

                  const SizedBox(height: 20,),
                  const Text("DASH - The Humming Bird",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 22),),
                  const SizedBox(height: 20,),
                  const Text("Sign up To Continue...",style: TextStyle(color: Colors.black,fontSize: 18),),

                  const SizedBox(height: 60,),
                  Container(
                    padding: const EdgeInsets.all(16),
                      decoration:BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),

                      ),child: const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: 2,
            ),
            const SizedBox(width: 20,),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Text("Sign Up",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 20,),
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

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)
                            ),

                            child: const Center(child: Text("Cancel")) ,
                          ),
                        ),
                        const SizedBox(width: 60,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false,);
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)
                            ),

                            child: const Center(child: Text("Create Account")) ,
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(width: 20,),],

        ),
      ),
    );
  }
}
