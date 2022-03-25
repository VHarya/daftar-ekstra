import 'package:flutter/material.dart';

class EkstraProfile extends StatelessWidget {
  const EkstraProfile({ Key? key, required this.ekstra, required this.pembina }) : super(key: key);

  final String ekstra;
  final String pembina;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30.0,top: 15.0),
          child: Text(
              ekstra,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
        ),
        Row (
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30.0,top: 5.0),
              child: const Text(
                'Pembina',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.5,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                  height: 1,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0,top: 5.0),
              child: Text(
                pembina,
                style: const TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14.5,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                  height: 1,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}