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
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: (MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(this.image),
          alignment: const Alignment(-1.1, 0.00),
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        border: Border.all(
          color: const Color(0xff888888),
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
      child: FractionallySizedBox(
          alignment: const Alignment(0.85, 0.0),
          widthFactor: 0.675,
          heightFactor: 0.88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(this.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9.15),
                      child: Text(this.subtitle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ISBN: " + this.isbn13,
                      style: const TextStyle(
                        fontSize: 12,
                      )),
                  Text(this.price,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
