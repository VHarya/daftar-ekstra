import 'package:flutter/material.dart';

class NilaiText extends StatelessWidget {
  const NilaiText({ Key? key, required this.nilai, required this.ekstra, required this.pembina }) : super(key: key);

  final String nilai;
  final String ekstra;
  final String pembina;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nilai + '%',
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat'
          )
        ),
        Text(
          ekstra,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            fontFamily: 'Montserrat'
          )
        ),
        Text(
          pembina,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            fontFamily: 'Montserrat'
          )
        ),
        const SizedBox(
          height: 65,
        ),
      ],
    );
  }
}