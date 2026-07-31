import 'package:flutter/material.dart';

class BarangKeluarScreen extends StatelessWidget {
  const BarangKeluarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Barang Keluar")),
      body: const Center(
        child: Text("Halaman Barang Keluar"),
      ),
    );
  }
}
