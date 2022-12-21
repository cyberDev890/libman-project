import 'package:get/get.dart';

class Product extends GetxController {
  final String? image;
  final String? title;
  final String? description;
  final String? semester;
  final int? size;
  final int? id;
  Product({
    this.id,
    this.image,
    this.title,
    this.semester,
    this.description,
    this.size,
  });
}

final List<Product> products = [
  Product(
    id: 1,
    title: "Matematika",
    semester: 'Semester 1',
    size: 8,
    description: dummyText,
    image: "image/images/buku1.png",
  ),
  Product(
    id: 2,
    title: "Pkn",
    semester: 'Semester 1',
    size: 8,
    description: dummyText,
    image: "image/images/buku2.png",
  ),
  Product(
    id: 3,
    title: "Ipa",
    semester: 'Semester 1',
    size: 10,
    description: dummyText,
    image: "image/images/buku3.jpeg",
  ),
  Product(
    id: 4,
    title: "Bahasa Inggris",
    semester: 'Semester 1',
    size: 11,
    description: dummyText,
    image: "image/images/buku4.jpg",
  ),
  Product(
    id: 5,
    title: "Matematika",
    semester: 'Semester 1',
    size: 12,
    description: dummyText,
    image: "image/images/buku5.jpg",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
