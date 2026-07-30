import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset(
                "assets/images/logoWin.png",
                width: 130,
              ),

              const SizedBox(height: 25),

              const Text(
                "WINFIT",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 35),

              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                obscureText: hidePassword,

                decoration: InputDecoration(
                  hintText: "Password",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {},

                  child: const Text("LOGIN"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
