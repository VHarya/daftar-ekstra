// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        required this.nama,
        required this.kelas,
        required this.absen,
        required this.ekstra,
    });

    String nama;
    String kelas;
    String absen;
    List<Ekstra> ekstra;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        nama: json["nama"],
        kelas: json["kelas"],
        absen: json["absen"],
        ekstra: List<Ekstra>.from(json["ekstra"].map((x) => Ekstra.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "kelas": kelas,
        "absen": absen,
        "ekstra": List<dynamic>.from(ekstra.map((x) => x.toJson())),
    };
}

class Ekstra {
    Ekstra({
        required this.nama,
        required this.pembimbing,
    });

    String nama;
    String pembimbing;

    factory Ekstra.fromJson(Map<String, dynamic> json) => Ekstra(
        nama: json["nama"],
        pembimbing: json["pembimbing"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "pembimbing": pembimbing,
    };
}
