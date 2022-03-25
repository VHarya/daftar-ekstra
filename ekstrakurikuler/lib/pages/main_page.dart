import 'package:ekstrakurikuler/pages/detail.dart';
import 'package:ekstrakurikuler/pages/profile.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'grade.dart';
import 'detail.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    ProfilePage(),
    DashboardPage(),
    GradePage()
  ];
  int currentIndex=1;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blue[800],
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(title: Text("Profile"),icon: Icon(Icons.archive)),
          BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text("Grade"),icon: Icon(Icons.school)),
        ],
      ),
    );
  }
}