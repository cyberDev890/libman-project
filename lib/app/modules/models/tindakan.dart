// To parse this JSON data, do
//
//     final tindakan = tindakanFromJson(jsonString);

import 'dart:convert';

List<Tindakan> tindakanFromJson(String str) => List<Tindakan>.from(json.decode(str).map((x) => Tindakan.fromJson(x)));

String tindakanToJson(List<Tindakan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tindakan {
    Tindakan({
        this.namaBuku,
        this.idKembali,
        this.semester,
        this.tanggalPengembalian,
    });

    String? namaBuku;
    String? idKembali;
    String? semester;
    DateTime? tanggalPengembalian;

    factory Tindakan.fromJson(Map<String, dynamic> json) => Tindakan(
        namaBuku: json["nama_buku"],
        idKembali: json["id_kembali"],
        semester: json["semester"],
        tanggalPengembalian: DateTime.parse(json["tanggal_pengembalian"]),
    );

    Map<String, dynamic> toJson() => {
        "nama_buku": namaBuku,
        "id_kembali": idKembali,
        "semester": semester,
        "tanggal_pengembalian": "${tanggalPengembalian!.year.toString().padLeft(4, '0')}-${tanggalPengembalian!.month.toString().padLeft(2, '0')}-${tanggalPengembalian!.day.toString().padLeft(2, '0')}",
    };
}
