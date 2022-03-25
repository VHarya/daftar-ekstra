// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.idUser,
        required this.idSiswa,
    });

    int idUser;
    int idSiswa;

    factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        idSiswa: json["id_siswa"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_siswa": idSiswa,
    };
}
