import 'dart:convert';

List<Buku> bukuFromJson(String str) =>
    List<Buku>.from(json.decode(str).map((x) => Buku.fromJson(x)));

String bukuToJson(List<Buku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buku {
  Buku({
    required this.kdBuku,
    required this.namaBuku,
    required this.jenisBuku,
    required this.semester,
    required this.tingkatan,
    required this.jumlah,
    required this.gambar,
  });

  final String kdBuku;
  final String namaBuku;
  final String jenisBuku;
  final String semester;
  final String tingkatan;
  final String jumlah;
  final String gambar;

  Buku copyWith({
    required String kdBuku,
    required String namaBuku,
    required String jenisBuku,
    required String semester,
    required String tingkatan,
    required String jumlah,
    required String gambar,
  }) =>
      Buku(
        kdBuku: kdBuku,
        namaBuku: namaBuku,
        jenisBuku: jenisBuku,
        semester: semester,
        tingkatan: tingkatan,
        jumlah: jumlah,
        gambar: gambar,
      );

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        kdBuku: json["kd_buku"] == null ? null : json["kd_buku"],
        namaBuku: json["nama_buku"] == null ? null : json["nama_buku"],
        jenisBuku: json["jenis_buku"] == null ? null : json["jenis_buku"],
        semester: json["semester"] == null ? null : json["semester"],
        tingkatan: json["tingkatan"] == null ? null : json["tingkatan"],
        jumlah: json["jumlah"] == null ? null : json["jumlah"],
        gambar: json["gambar"] == null ? null : json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "kd_buku": kdBuku == null ? null : kdBuku,
        "nama_buku": namaBuku == null ? null : namaBuku,
        "jenis_buku": jenisBuku == null ? null : jenisBuku,
        "semester": semester == null ? null : semester,
        "tingkatan": tingkatan == null ? null : tingkatan,
        "jumlah": jumlah == null ? null : jumlah,
        "gambar": gambar == null ? null : gambar,
      };
}
