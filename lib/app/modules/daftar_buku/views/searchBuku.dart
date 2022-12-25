// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:libman/app/modules/api/api.dart';
// import 'package:libman/app/modules/api/connectedApi.dart';
// import 'package:http/http.dart' as http;
// import 'package:libman/app/modules/detail/views/detail_view.dart';
// import '../../models/buku.dart';

// import '../../models/bukuApi.dart';

// class searchBuku extends StatefulWidget {
//   late String keywords;
//   searchBuku({super.key, required this.keywords});

//   @override
//   State<searchBuku> createState() => _daftarbukuState();
// }

// class _daftarbukuState extends State<searchBuku> {
//   ConnectApi connect = Get.put(ConnectApi());
//   TextEditingController search = TextEditingController();
//   List<Buku> data2 = [];
//   bool isLoading = true;
//   Future _getData() async {
//     final response = await http.get(Uri.parse(API.daftarBuku));
//     if (response.statusCode == 200) {
//       final data = bukuFromJson(response.body.toString());
//       setState(() {
//         data2 = data;
//         data2 = data2
//             .where((element) =>
//                 element.namaBuku.toLowerCase().contains(widget.keywords))
//             .toList();
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     _getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               color: Color(0xffAEAEB2),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.more_vert),
//               color: Color(0xffAEAEB2),
//             ),
//           ],
//           backgroundColor: Color(0xff0041C4),
//           title: Center(
//             child: Text('Daftar Buku',
//                 style: TextStyle(
//                     letterSpacing: 0.5,
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Mulish')),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 6.0,
//                   horizontal: 12.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(20.0),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         controller: search,
//                         initialValue: null,
//                         decoration: InputDecoration.collapsed(
//                           filled: true,
//                           fillColor: Colors.transparent,
//                           hintText: "Cari",
//                           hintStyle: TextStyle(
//                               color: Colors.grey[500], fontFamily: 'Mulish'),
//                           hoverColor: Colors.transparent,
//                         ),
//                         onFieldSubmitted: (value) {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               height: size.height * 0.8,
//               child: data2.isEmpty
//                   ? Center(child: CircularProgressIndicator())
//                   : RefreshIndicator(
//                       onRefresh: _getData,
//                       child: ListView.builder(
//                           itemCount: data2.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return GestureDetector(
//                                 onTap: () {
//                                   Get.to(
//                                     () => DetailView(
//                                         product: products[index],
//                                         listData: {
//                                           'nama_buku': data2[index].namaBuku,
//                                           'jenis_buku': data2[index].jenisBuku,
//                                           'semester': data2[index].semester,
//                                           'tingkatan': data2[index].tingkatan,
//                                           'jumlah': data2[index].jumlah,
//                                         }),
//                                   );
//                                 },
//                                 child: Card(
//                                     child: Row(children: [
//                                   Container(
//                                     width: 100,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(10),
//                                           bottomLeft: Radius.circular(10)),
//                                       child: Image.asset(
//                                         products[index].image!,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Container(
//                                           height: 25,
//                                           child: Text(data2[index].namaBuku,
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Mulish')),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: 20,
//                                               margin:
//                                                   EdgeInsets.only(bottom: 5),
//                                               child: const Icon(
//                                                 Icons.circle_sharp,
//                                                 color: Color(0xffE5E5EA),
//                                                 size: 20,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 11,
//                                             ),
//                                             Container(
//                                               height: 20,
//                                               margin: EdgeInsets.fromLTRB(
//                                                   0, 0, 15, 0),
//                                               child: Text(
//                                                   "Semester " +
//                                                       data2[index].semester,
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontFamily:
//                                                           'Mulish-Regular.ttf')),
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: 20,
//                                               margin:
//                                                   EdgeInsets.only(bottom: 5),
//                                               child: const Icon(
//                                                 Icons.circle_sharp,
//                                                 color: Color(0xffE5E5EA),
//                                                 size: 20,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 11,
//                                             ),
//                                             Container(
//                                               height: 20,
//                                               margin: EdgeInsets.fromLTRB(
//                                                   0, 0, 15, 0),
//                                               child: Text(
//                                                   "Stok: " +
//                                                       data2[index].jumlah,
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       fontFamily:
//                                                           'Mulish-Regular.ttf')),
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         TextButton(
//                                           style: TextButton.styleFrom(
//                                               backgroundColor:
//                                                   Color(0xffD6FDF3)),
//                                           onPressed: () {},
//                                           child: Text(
//                                             "Tersedia",
//                                             style: TextStyle(
//                                                 color: Color(0xff46B094),
//                                                 fontSize: 14,
//                                                 fontFamily:
//                                                     'Mulish-Regular.ttf'),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ])));
//                           }),
//                     ),
//             ),
//           ],
//         )));
//   }
// }
