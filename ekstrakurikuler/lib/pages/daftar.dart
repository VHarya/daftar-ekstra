import 'package:flutter/material.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
         title: Text("Form Pendaftaraan",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,      
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left:30, top: 15),
              child: Text("Nama Lengkap",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18),),
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              width: 350,
              height: 40,
              child: Theme( 
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              child: Text("Kelas",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18),),
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              width: 350,
              height: 40,
              child: Theme( 
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              child: Text("Jurusan",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18),),
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              width: 350,
              height: 40,
              child: Theme( 
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              child: Text("Nomor HP",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18),),
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              width: 350,
              height: 40,
              child: Theme( 
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              child: Text("Email",style: TextStyle(fontFamily: 'Montserrat',fontSize: 18),),
            ),
            Container(
              padding: const EdgeInsets.only(left:30),
              width: 350,
              height: 40,
              child: Theme( 
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFEEEEEE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 35.0,
              ),
        Container(
          alignment: Alignment.bottomCenter,
           child: SizedBox(
                width: 280,
                height: 40, //width of button
                child: ElevatedButton(
                  
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPage()),
                      );
                    },
                    child: Text('Daftar Ekstrakurikuler',style: TextStyle(
                          fontSize: 20.0,fontWeight: FontWeight.w500),
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xff0D6EFD)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                  )))),
              ),
          ),
          SizedBox(
                height: 25.0,
              ),
          Container(
            child: Image(
              height: 106,
              width: 410,
              fit: BoxFit.fill,
              image: AssetImage('assets/vector.png'),
            ),
          ),
          ],
        ),
      ),
    );
  }
}