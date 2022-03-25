import 'dart:async';
import 'dart:convert';

import 'package:ekstrakurikuler/custom_widgets/EkstraProfile.dart';
import 'package:ekstrakurikuler/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ekstrakurikuler/classes/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Profile> getUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  int userID = prefs.getInt('userID') ?? -1;

  final response = await http.get(
    Uri.parse('http://192.168.100.22:8000/api/getSiswaData/' + userID.toString()),
  );
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get user');
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage ({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();

    futureProfile = getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<Profile>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  decoration: const BoxDecoration(color: Color(0xffDFE2FF)),
                  padding: const EdgeInsets.only(left: 30.0,top: 20.0),
                  child: const Text(
                    'Profil',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(color: const Color(0xffDFE2FF)),
                  padding: const EdgeInsets.only(left: 30.0,top: 10.0),
                  child: Text(
                    snapshot.data!.nama,
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 24,
                      color: Colors.black,
                      height: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(color: const Color(0xffDFE2FF)),
                  padding: const EdgeInsets.only(left: 30.0,top: 10.0),
                  child: Text(
                      snapshot.data!.kelas + ' - ' + snapshot.data!.absen,
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 15.5,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                ),
            
                const SizedBox(
                  height: 10.0,
                ),
                
                Container(
                  padding: const EdgeInsets.only(left: 30.0,top: 20.0),
                  child: const Text(
                    'Ekstrakurikuler',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                
                for (var item in snapshot.data!.ekstra) EkstraProfile(ekstra: item.nama, pembina: item.pembimbing),
                
                const SizedBox(
                  height: 160.0,
                ),
            
                Container(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 242,
                    height: 40, //width of button
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Myapp()),
                        );
                      },
                      child: Text('Keluar Akun',style: TextStyle(
                            fontSize: 20.0),
                      ),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffEE6A6A)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          )
                        )
                      )
                    ),
                  ),
                ),
              ]
            );
          }
          
          return const CircularProgressIndicator();
        }
      ),
    );
  }
}