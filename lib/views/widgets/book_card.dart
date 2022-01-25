import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ringier_test_task/views/book_detail.dart';

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
          image: CachedNetworkImageProvider(
            this.image,
          ),
          alignment: const Alignment(-1.1, 0.00),
        ),
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
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailCard(
                          image:
                              "https://itbook.store/img/books/9781617294136.png",
                          title: "Hello World",
                          url: "https://itbook.store/books/9781617294136",
                          subtitle: "Security in the Cloud",
                          desc:
                              "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team's highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your cloud ...",
                          authors: "Julien Vehent",
                          pages: "467",
                          year: "2020",
                          publisher: "Ikaro",
                          isbn10: "1617294136",
                          isbn13: "9781617294136",
                          rating: "4.75",
                          price: r"$26.98",
                          pdf: {
                            "Chapter 2":
                                "https://itbook.store/files/9781617294136/chapter2.pdf",
                            "Chapter 5":
                                "https://itbook.store/files/9781617294136/chapter5.pdf"
                          })),
            );
          },
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
              ))),
    );
  }
}
