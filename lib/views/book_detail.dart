import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailCard extends StatelessWidget {
  final String title;
  /*final String subtitle;
  final String price;
  final String rating;
  final String pages;
  final String isbn13;
  final String isbn10;
  final String authors;
  final String publisher;
  final String year;
  final String desc;*/
  final String image;
  /*final String url;
  final Map pdf;*/

  const DetailCard({
    required this.title,
    /* required this.subtitle,
      required this.price,
      required this.rating,
      required this.pages,
      required this.isbn13,
      required this.isbn10,
      required this.authors,
      required this.publisher,
      required this.year,
      required this.desc,*/
    required this.image,
    /*required this.url,
      required this.pdf*/
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: const Text("Book Detail"),
      actions: const [],
    ));
    /*Column(
      children: [CachedNetworkImage(imageUrl: this.image)],
    );*/
  }
}
