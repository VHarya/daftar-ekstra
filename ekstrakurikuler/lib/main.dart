import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'classes/User.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Myapp()));
}

Future<User> getLoginDetails(String username, String password) async {
  final response = await http.get(
    Uri.parse('http://192.168.100.22:8000/api/login/' + username + '/' + password)
  );

  if (response.statusCode == 200) {
    User u = User.fromJson(jsonDecode(response.body));
    return u;
  } else {
    throw Exception('Failed to get user');
  }
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late Future<User> user;
  bool userFound = true;
  
  void loginCheck() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == '' || password == '') {
      setState(() {
        userFound = false;
      });
      return;
    } 

    getLoginDetails(username, password).then(
      (value) async {
        if (value != null) {
          setState(() {
            userFound = true;
          });

          final prefs = await SharedPreferences.getInstance();
          prefs.setInt("userID", value.idUser);
          prefs.setInt("siswaID", value.idSiswa);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage()),
          );
        }
        else {
          setState(() {
            userFound = false;
          });
        }
      }
    );

    
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                height: height * 0.50,
                child: Image.asset(
                  'assets/login.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 25,right: 25),
                child: TextField(
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    suffixIcon: Icon(Icons.perm_identity),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8,left: 25,right: 25),
                child: TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              if (!userFound) const Padding(
                padding: EdgeInsets.only(top: 15), 
                child: Text(
                  'Username atau Password Salah',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              SizedBox(
                width: 265,
                child: ElevatedButton(
                  onPressed: () {
                    loginCheck();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue)
                      )
                    )
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


