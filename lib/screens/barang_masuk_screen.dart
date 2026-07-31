import 'package:flutter/material.dart';

class BarangMasukScreen extends StatelessWidget {
  const BarangMasukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Barang Masuk")),
      body: const Center(
        child: Text("Halaman Barang Masuk"),
      ),
    );
  }
}
