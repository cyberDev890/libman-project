import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

List<String> image = [
  "image/daftarBuku/ipa.png",
  "image/daftarBuku/ips.png",
  "image/daftarBuku/mtk.png",
  "image/daftarBuku/olahraga.png",
  "image/daftarBuku/senibudaya.png",
];
List<String> stringImage = [
  "IPA",
  "IPS",
  "MTK",
  "Olahraga",
  "SBK",
];

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: image.length,
            itemBuilder: (contex, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Hero(
                      tag: image[index],
                      child: Image.asset(
                        image[index],
                        width: 54.0,
                        height: 54.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("${stringImage[index]}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish')),
                  ),
                ],
              );
            }));
  }
}
