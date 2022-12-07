// To parse this JSON data, do
//
//     final userData = userDataFromMap(jsonString);

import 'dart:convert';

UserData userDataFromMap(String str) => UserData.fromMap(json.decode(str));

String userDataToMap(UserData data) => json.encode(data.toMap());

class UserData {
  UserData({
    required this.status,
    required this.message,
    required this.data,
  });
  final String status;
  final String message;
  final List<Data>? data;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromMap(x))),  
              
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data?.map((x) => x.toMap()) ?? []),
      };
}

class Data {
  Data({
    required this.nis,
    required this.namaSiswa,
    required this.password,
    required this.tingkatan,
    required this.kelas,
    required this.jenisKelamin,
    required this.notelp,
    required this.gambar,
  });

  final String nis;
  final String namaSiswa;
  final String password;
  final String tingkatan;
  final String kelas;
  final String jenisKelamin;
  final String notelp;
  final dynamic gambar;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        nis: json["NIS"] == null ? null : json["NIS"],
        namaSiswa: json["nama_siswa"] == null ? null : json["nama_siswa"],
        password: json["password"] == null ? null : json["password"],
        tingkatan: json["tingkatan"] == null ? null : json["tingkatan"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        jenisKelamin:
            json["jenis_kelamin"] == null ? null : json["jenis_kelamin"],
        notelp: json["notelp"] == null ? null : json["notelp"],
        gambar: json["gambar"] == null ? null : json["gambar"],
      );

  Map<String, dynamic> toMap() => {
        "NIS": nis == null ? null : nis,
        "nama_siswa": namaSiswa == null ? null : namaSiswa,
        "password": password == null ? null : password,
        "tingkatan": tingkatan == null ? null : tingkatan,
        "kelas": kelas == null ? null : kelas,
        "jenis_kelamin": jenisKelamin == null ? null : jenisKelamin,
        "notelp": notelp == null ? null : notelp,
        "gambar": gambar == null ? null : gambar,
      };
}
