import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String isbn13;
  final String price;

  const BookCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isbn13,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: (MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(this.image),
            alignment: Alignment.centerLeft,
          ),
          color: Colors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "$title\n $subtitle\n $isbn13\n $price",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            alignment: Alignment.centerRight,
          ),
        ]));
  }
}
