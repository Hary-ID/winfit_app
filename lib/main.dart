import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const WinFitApp());
}

class WinFitApp extends StatelessWidget {
  const WinFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WinFit',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(
      'assets/images/logoWin.png',
      width: 150,
      height: 150,
    ),

    const SizedBox(height: 20),

    const Text(
      "PROGRAM",
      style: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        letterSpacing: 3,
      ),
    ),

    const SizedBox(height: 10),

            Text(
              "Build Your Future",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(
              color: Colors.white,
            )

          ],
        ),
      ),
    );
  }
}

