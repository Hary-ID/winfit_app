import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'register_screen.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {


  final usernameController =
      TextEditingController();


  final passwordController =
      TextEditingController();



  bool hidePassword = true;



  void login() {


    if (usernameController.text == "admin" &&
        passwordController.text == "1234") {


      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder: (context) =>
              const DashboardScreen(),

        ),

      );


    } else {


      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content:
              Text(
                "Username atau password salah",
              ),

        ),

      );


    }

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor:
          const Color(0xFF0F172A),


      body: Center(

        child: Padding(

          padding:
              const EdgeInsets.all(25),


          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,


            children: [


              const Text(

                "WINFIT STOCK",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 28,

                  fontWeight:
                      FontWeight.bold,

                ),

              ),


              const SizedBox(
                height: 30,
              ),



              TextField(

                controller:
                    usernameController,


                decoration:
                    const InputDecoration(

                  filled: true,

                  fillColor:
                      Colors.white,

                  hintText:
                      "Username",

                ),

              ),



              const SizedBox(
                height: 15,
              ),



              TextField(

                controller:
                    passwordController,


                obscureText:
                    hidePassword,


                decoration:
                    InputDecoration(

                  filled: true,

                  fillColor:
                      Colors.white,


                  hintText:
                      "Password",


                  suffixIcon:
                      IconButton(

                    icon: Icon(

                      hidePassword

                          ? Icons.visibility_off

                          : Icons.visibility,

                    ),


                    onPressed: () {

                      setState(() {

                        hidePassword =
                            !hidePassword;

                      });

                    },

                  ),

                ),

              ),



              const SizedBox(
                height: 25,
              ),



              SizedBox(

                width:
                    double.infinity,


                child:
                    ElevatedButton(

                  style:
                      ElevatedButton.styleFrom(

                    backgroundColor:
                        Colors.pink,

                  ),


                  onPressed:
                      login,


                  child:
                      const Text(

                    "LOGIN",

                    style:
                        TextStyle(

                      color:
                          Colors.white,

                      fontSize:
                          18,

                    ),

                  ),

                ),

              ),



              TextButton(

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) =>
                          const RegisterScreen(),

                    ),

                  );

                },


                child:
                    const Text(

                  "Belum punya akun? Daftar",

                  style:
                      TextStyle(

                    color:
                        Colors.white,

                  ),

                ),

              )


            ],

          ),

        ),

      ),

    );

  }

}
