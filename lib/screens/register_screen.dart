import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF3B82F6),
              Color(0xFFFF4FA3),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Column(
                  children: [

                    const Icon(
                      Icons.person_add_alt_1,
                      size: 90,
                      color: Colors.white,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Buat Akun WinFit",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 35),

                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Nama Lengkap",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF3B82F6),
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFF3B82F6),
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: passwordController,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFFFF4FA3),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: confirmPasswordController,
                      obscureText: hideConfirmPassword,
                      decoration: InputDecoration(
                        hintText: "Konfirmasi Password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFFFF4FA3),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hideConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              hideConfirmPassword =
                                  !hideConfirmPassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF3B82F6),
                            Color(0xFFFF4FA3),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          "DAFTAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sudah punya akun? Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
