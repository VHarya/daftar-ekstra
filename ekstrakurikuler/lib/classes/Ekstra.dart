// To parse this JSON data, do
//
//     final ekstra = ekstraFromJson(jsonString);

import 'dart:convert';

Ekstra ekstraFromJson(String str) => Ekstra.fromJson(json.decode(str));

String ekstraToJson(Ekstra data) => json.encode(data.toJson());

class Ekstra {
    Ekstra({
        required this.ekstra,
    });

    List<EkstraElement> ekstra;

    factory Ekstra.fromJson(Map<String, dynamic> json) => Ekstra(
        ekstra: List<EkstraElement>.from(json["ekstra"].map((x) => EkstraElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ekstra": List<dynamic>.from(ekstra.map((x) => x.toJson())),
    };
}

class EkstraElement {
    EkstraElement({
        required this.id,
        required this.nama,
        required this.deskripsi,
        required this.kegiatan,
        required this.pembimbing,
        required this.anggota,
        required this.icon,
    });

    int id;
    String nama;
    String deskripsi;
    String kegiatan;
    String pembimbing;
    int anggota;
    int icon;

    factory EkstraElement.fromJson(Map<String, dynamic> json) => EkstraElement(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        kegiatan: json["kegiatan"],
        pembimbing: json["pembimbing"],
        anggota: json["anggota"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "kegiatan": kegiatan,
        "pembimbing": pembimbing,
        "anggota": anggota,
        "icon": icon,
    };
}
