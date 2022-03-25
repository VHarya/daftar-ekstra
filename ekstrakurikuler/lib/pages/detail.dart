import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ekstrakurikuler/classes/Ekstra.dart';
import 'package:ekstrakurikuler/pages/main_page.dart';

Future<bool> daftarEkstra(int ekstraID) async {
  final prefs = await SharedPreferences.getInstance();
  int siswaID = prefs.getInt('siswaID') ?? -1;

  final response = await http.post(
    Uri.parse('http://192.168.100.22:8000/api/daftarEkstra'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      'id_ekstra': ekstraID,
      'id_siswa' : siswaID,
    }),
  );

  print(ekstraID);
  print(siswaID);
  print(response.statusCode);

  if (response.statusCode == 201) {
    return true;
  }
  else {
    return false;
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key, required this.ekstra }) : super(key: key);

  final EkstraElement ekstra;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FToast fToast = FToast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,      
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.only(right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 20.0),
            child: Text(
              widget.ekstra.nama,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600
              ), 
              textAlign: TextAlign.left,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              widget.ekstra.deskripsi,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              "Informasi Detail",
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600
              ), 
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              'Nama Pembina',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.5,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 5),
            child: Text(
              widget.ekstra.pembimbing,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              'Jumlah Anggota',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.5,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 5),
            child: Text(
              "${widget.ekstra.anggota} Siswa",
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              'Kegiatan',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.5,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
                color: Colors.black,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0,top: 5),
            child: Text(
              widget.ekstra.kegiatan,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400
                ),
              ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 280,
              height: 40, //width of button
              child: ElevatedButton(  
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Peringatan!'),
                    content: const Text('Apakah anda yakin memilih Ekstrakurikuler ini?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Tidak'),
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () => setState(() {
                          daftarEkstra(widget.ekstra.id).then((value) {
                            if (value) {
                              fToast.showToast(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.greenAccent,
                                  ),
                                  child: const Text("Pendaftaran Berhasil"), 
                                )
                              );

                              Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const MainPage()));
                            } else {
                              fToast.showToast(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.redAccent,
                                  ),
                                  child: const Text(
                                    "Pendaftaran Gagal",
                                    style: TextStyle(color: Colors.white),
                                  ), 
                                )
                              );

                              Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const MainPage()));
                            }
                          });
                        }),
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                ),
                child: const Text(
                  'Daftar Ekstrakurikuler',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0D6EFD)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                    )
                  )
                )
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 45.0
            )
          ),
        ],
      )
      ),
    );
  }
}