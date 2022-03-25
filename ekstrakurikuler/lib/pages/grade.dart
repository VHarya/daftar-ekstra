import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:ekstrakurikuler/classes/Nilai.dart';
import 'package:ekstrakurikuler/custom_widgets/NilaiText.dart';

Future<Nilai> getNilaiSiswa() async {
  final prefs = await SharedPreferences.getInstance();
  int userID = prefs.getInt('userID') ?? -1;

  final response = await http.get(
    Uri.parse('http://192.168.100.22:8000/api/getNilaiSiswa/$userID')
  );

  if (response.statusCode == 200) {
    return Nilai.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get data');
  }
}

class GradePage extends StatefulWidget {
  const GradePage({Key? key}) : super(key: key);

  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  late Future<Nilai> futureNilai;

  @override
  void initState() {
    super.initState();

    futureNilai = getNilaiSiswa();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: FutureBuilder<Nilai>(
          future: futureNilai,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  const Positioned(
                    child: Image(     
                      height: 200,
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/BG.png'),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 35,
                            ),
                            const Text('REKAP NILAI',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat'
                              )
                            ),                
                            const SizedBox(
                              height: 35,
                            ),
                            for (var item in snapshot.data!.nilai) NilaiText(nilai: item.nilai.toString(), ekstra: item.ekstra, pembina: item.pembimbing)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }

            return const CircularProgressIndicator();
          },
        ) 
    );
  }
}
