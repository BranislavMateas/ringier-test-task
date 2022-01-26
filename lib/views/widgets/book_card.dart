import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ringier_test_task/views/book_detail.dart';
import 'package:ringier_test_task/models/detail/detail.api.dart';
import 'package:ringier_test_task/models/detail/detail.dart';

class BookCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final String isbn13;
  final String price;

  const BookCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isbn13,
    required this.price,
  }) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  BookDetail? theBook;
  bool areResults = false;

  // API fetch method
  Future<void> fetchDetail(String query) async {
    theBook = await DetailApi.fetchDetail(query);
    setState(() {
      areResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: (MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            widget.image,
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
          onTap: () async {
            await fetchDetail(widget.isbn13);

            if (areResults) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailCard(
                          authors: theBook!.authors,
                          image: theBook!.image,
                          title: theBook!.title,
                          url: theBook!.url,
                          subtitle: theBook!.subtitle,
                          desc: theBook!.desc,
                          pages: theBook!.pages,
                          year: theBook!.year,
                          publisher: theBook!.publisher,
                          isbn10: theBook!.isbn10,
                          isbn13: theBook!.isbn13,
                          rating: theBook!.rating,
                          price: theBook!.price,
                          pdf: theBook!.pdf,
                        )),
              );
            }
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
                        Text(widget.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.15),
                          child: Text(widget.subtitle,
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
                      Text("ISBN: " + widget.isbn13,
                          style: const TextStyle(
                            fontSize: 12,
                          )),
                      Text(widget.price,
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
