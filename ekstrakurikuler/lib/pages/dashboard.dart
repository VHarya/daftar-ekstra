import 'dart:async';
import 'dart:convert';

import 'package:ekstrakurikuler/pages/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ekstrakurikuler/classes/Ekstra.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Ekstra> getAllEkstra() async {
  final response = await http.get(
    Uri.parse('http://192.168.100.22:8000/api/getAllEkstra')
  );

  if (response.statusCode == 200) {
    return Ekstra.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get data');
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage ({ Key? key, this.message }) : super(key: key);

  final String? message;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<Ekstra> futureEkstra;

  @override
  void initState() {
    super.initState();

    futureEkstra = getAllEkstra();
  }

  @override
  Widget build(BuildContext context) {
    List<MenuData> menu = [];
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      	title: Text('Ekstrakurikuler'),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 33,fontWeight: FontWeight.w600, letterSpacing: 1.6),
        centerTitle: true, 
        automaticallyImplyLeading: false,
        bottomOpacity: 0.0,
        elevation: 0.0,      
      ),
      body: SafeArea(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: FutureBuilder<Ekstra>(
        future: futureEkstra,
        builder: (context, snapshot) {
          // print("Snapshot ${snapshot}");
          if (snapshot.hasData) {
            for (var item in snapshot.data!.ekstra) {
              menu.add(MenuData(IconData(item.icon, fontFamily: 'MaterialIcons'), item.nama, item));
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: menu.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0.2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(ekstra: menu[index].ekstra)
                            )
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              menu[index].icon,
                              size: 80,
                            ),
                            SizedBox(height: 20),
                            Text(
                              menu[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
              ),
            );
          }

          return const CircularProgressIndicator();
      },) 
      ),
     ),
    );
   } 
}
class MenuData {
  MenuData(this.icon, this.title, this.ekstra);
  final IconData icon;
  final String title;
  final EkstraElement ekstra;
}
