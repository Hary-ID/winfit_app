import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'tambah_barang_screen.dart';
import 'edit_barang_screen.dart';


class BarangScreen extends StatefulWidget {

  const BarangScreen({super.key});


  @override
  State<BarangScreen> createState() =>
      _BarangScreenState();

}



class _BarangScreenState extends State<BarangScreen> {


  List<Map<String, dynamic>> barang = [];

  List<Map<String, dynamic>> filteredBarang = [];


  final TextEditingController searchController =
      TextEditingController();



  @override
  void initState() {

    super.initState();

    loadBarang();

  }




  Future<void> loadBarang() async {

    final data =
        await DatabaseHelper.instance
            .getAllBarang();


    setState(() {

      barang = data;

      filteredBarang = data;

    });

  }





  void searchBarang(String keyword) {


    setState(() {


      filteredBarang =
          barang.where((item) {


        return item['nama']
            .toString()
            .toLowerCase()
            .contains(
              keyword.toLowerCase(),
            );


      }).toList();


    });


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:
          const Color(0xFFF5F7FB),



      appBar: AppBar(


        elevation: 0,


        centerTitle: true,


        backgroundColor:
            const Color(0xFF1976D2),


        title: const Text(

          "Data Barang",

          style: TextStyle(

            color: Colors.white,

            fontWeight:
                FontWeight.bold,

          ),

        ),

      ),





      body: Column(


        children: [


          Padding(

            padding:
                const EdgeInsets.all(12),


            child: TextField(


              controller:
                  searchController,


              onChanged:
                  searchBarang,


              decoration:
                  InputDecoration(


                hintText:
                    "Cari barang...",


                prefixIcon:
                    const Icon(
                      Icons.search,
                      color: Color(0xFF1976D2),
                    ),



                filled: true,


                fillColor:
                    Colors.white,



                border:
                    OutlineInputBorder(


                  borderRadius:
                      BorderRadius.circular(15),


                  borderSide:
                      BorderSide.none,


                ),


              ),


            ),


          ),






          Expanded(


            child:


                filteredBarang.isEmpty


                ? const Center(


                    child: Text(

                      "Belum ada data barang",

                      style:
                          TextStyle(

                        fontSize: 16,

                      ),

                    ),


                  )



                : ListView.builder(


                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),



                    itemCount:
                        filteredBarang.length,



                    itemBuilder:
                        (context,index) {


                      final item =
                          filteredBarang[index];



                      return Card(


                        elevation:
                            5,


                        margin:
                            const EdgeInsets.only(
                              bottom: 12,
                            ),



                        shape:
                            RoundedRectangleBorder(


                          borderRadius:
                              BorderRadius.circular(16),


                        ),



                        child:
                            ListTile(


                          contentPadding:
                              const EdgeInsets.all(12),



                          leading:
                              Container(


                            width:45,

                            height:45,



                            decoration:
                                BoxDecoration(


                              gradient:
                                  const LinearGradient(

                                colors:[

                                  Color(0xFF2196F3),

                                  Color(0xFF00BCD4),

                                ],

                              ),



                              borderRadius:
                                  BorderRadius.circular(12),


                            ),



                            child:
                                const Icon(

                              Icons.inventory_2,

                              color:
                                  Colors.white,

                            ),



                          ),





                          title:
                              Text(


                            item['nama'],


                            style:
                                const TextStyle(


                              fontWeight:
                                  FontWeight.bold,


                              fontSize:
                                  16,


                            ),


                          ),





                          subtitle:
                              Column(


                            crossAxisAlignment:
                                CrossAxisAlignment.start,



                            children:[


                              Text(
                                "Kode : ${item['kode']}",
                              ),


                              Text(
                                "Stok : ${item['stok']} ${item['satuan']}",
                              ),


                            ],


                          ),







                          trailing:
                              SizedBox(


                            width:100,


                            child:
                                Row(


                              children:[



                                Container(


                                  decoration:
                                      BoxDecoration(


                                    color:
                                        const Color(0xFF2196F3),


                                    borderRadius:
                                        BorderRadius.circular(10),


                                  ),



                                  child:
                                      IconButton(


                                    icon:
                                        const Icon(

                                      Icons.edit,

                                      color:
                                          Colors.white,

                                    ),



                                    onPressed:
                                        () async {


                                      await Navigator.push(


                                        context,


                                        MaterialPageRoute(


                                          builder:
                                              (context) =>

                                                  EditBarangScreen(

                                            barang:item,

                                          ),


                                        ),


                                      );



                                      loadBarang();



                                    },

                                  ),


                                ),




                                const SizedBox(
                                  width:5,
                                ),




                                Container(


                                  decoration:
                                      BoxDecoration(


                                    color:
                                        Colors.pink,


                                    borderRadius:
                                        BorderRadius.circular(10),


                                  ),



                                  child:
                                      IconButton(


                                    icon:
                                        const Icon(


                                      Icons.delete,


                                      color:
                                          Colors.white,


                                    ),



                                    onPressed:
                                        () async {


                                      await DatabaseHelper.instance
                                          .deleteBarang(
                                            item['id'],
                                          );



                                      loadBarang();



                                    },


                                  ),


                                ),



                              ],


                            ),


                          ),


                        ),


                      );


                    },


                  ),



          ),



        ],


      ),






      floatingActionButton:
          FloatingActionButton(


        backgroundColor:
            Colors.pink,


        child:
            const Icon(

          Icons.add,

          color:
              Colors.white,

        ),



        onPressed:
            () async {



          await Navigator.push(


            context,


            MaterialPageRoute(


              builder:
                  (context) =>

                      const TambahBarangScreen(),


            ),


          );



          loadBarang();



        },


      ),



    );


  }


}
