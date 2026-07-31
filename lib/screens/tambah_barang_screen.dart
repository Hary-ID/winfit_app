import '../database/database_helper.dart';
import 'package:flutter/material.dart';

class TambahBarangScreen extends StatefulWidget {
  const TambahBarangScreen({super.key});

  @override
 State<TambahBarangScreen> createState() => _TambahBarangScreenState();
}

class _TambahBarangScreenState extends State<TambahBarangScreen> {
  final kodeController = TextEditingController();
  final namaController = TextEditingController();
  final stokController = TextEditingController();
  final satuanController = TextEditingController();
  final kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("Tambah Barang"),
        backgroundColor: const Color(0xFF3B82F6),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            buildField("Kode Barang", kodeController),
            const SizedBox(height: 15),

            buildField("Nama Barang", namaController),
            const SizedBox(height: 15),

            buildField("Stok Awal", stokController,
                keyboard: TextInputType.number),
            const SizedBox(height: 15),

            buildField("Satuan", satuanController),
            const SizedBox(height: 15),

            buildField("Kategori", kategoriController),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4FA3),
                ),
                onPressed: () async {
  await DatabaseHelper.instance.insertBarang({
    'kode': kodeController.text,
    'nama': namaController.text,
    'kategori': kategoriController.text,
    'satuan': satuanController.text,
    'stok': int.tryParse(stokController.text) ?? 0,
  });

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Barang berhasil disimpan"),
    ),
  );

  Navigator.pop(context);
},
                child: const Text(
                  "SIMPAN",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildField(
    String label,
    TextEditingController controller, {
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
