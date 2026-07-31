import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class EditBarangScreen extends StatefulWidget {

  final Map<String, dynamic> barang;

  const EditBarangScreen({
    super.key,
    required this.barang,
  });


  @override
  State<EditBarangScreen> createState() =>
      _EditBarangScreenState();

}


class _EditBarangScreenState
    extends State<EditBarangScreen> {


  late TextEditingController namaController;
  late TextEditingController hargaController;
  late TextEditingController stokController;


  @override
  void initState() {

    super.initState();

    namaController =
        TextEditingController(
          text: widget.barang['nama'],
        );

    hargaController =
        TextEditingController(
          text: widget.barang['harga'].toString(),
        );

    stokController =
        TextEditingController(
          text: widget.barang['stok'].toString(),
        );

  }



  Future<void> updateBarang() async {


    await DatabaseHelper.instance.updateBarang({

      'id': widget.barang['id'],

      'nama':
          namaController.text,

      'harga':
          int.parse(
            hargaController.text,
          ),

      'stok':
          int.parse(
            stokController.text,
          ),

    });


    Navigator.pop(context);


  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "Edit Barang",
            ),

        backgroundColor:
            const Color(0xFF1976D2),

      ),


      body: Padding(

        padding:
            const EdgeInsets.all(16),


        child: Column(

          children: [


            TextField(

              controller:
                  namaController,

              decoration:
                  const InputDecoration(
                    labelText:
                        "Nama Barang",
                  ),

            ),



            TextField(

              controller:
                  hargaController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(
                    labelText:
                        "Harga",
                  ),

            ),



            TextField(

              controller:
                  stokController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(
                    labelText:
                        "Stok",
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

                onPressed:
                    updateBarang,


                child:
                    const Text(
                      "Simpan Perubahan",
                    ),

              ),

            )


          ],

        ),

      ),

    );

  }

}
