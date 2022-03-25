// To parse this JSON data, do
//
//     final nilai = nilaiFromJson(jsonString);

import 'dart:convert';

Nilai nilaiFromJson(String str) => Nilai.fromJson(json.decode(str));

String nilaiToJson(Nilai data) => json.encode(data.toJson());

class Nilai {
    Nilai({
        required this.nilai,
    });

    List<NilaiElement> nilai;

    factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        nilai: List<NilaiElement>.from(json["nilai"].map((x) => NilaiElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nilai": List<dynamic>.from(nilai.map((x) => x.toJson())),
    };
}

class NilaiElement {
    NilaiElement({
        required this.ekstra,
        required this.nilai,
        required this.pembimbing,
    });

    String ekstra;
    int nilai;
    String pembimbing;

    factory NilaiElement.fromJson(Map<String, dynamic> json) => NilaiElement(
        ekstra: json["ekstra"],
        nilai: json["nilai"],
        pembimbing: json["pembimbing"],
    );

    Map<String, dynamic> toJson() => {
        "ekstra": ekstra,
        "nilai": nilai,
        "pembimbing": pembimbing,
    };
}
