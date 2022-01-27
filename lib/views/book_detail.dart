import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String pages;
  final String rating;
  final String price;
  final String isbn13;
  final String isbn10;
  final String publisher;
  final String year;
  final String authors;
  final String desc;
  final String image;
  final String url;
  final Map pdf;

  const DetailCard(
      {Key? key,
      required this.authors,
      required this.title,
      required this.subtitle,
      required this.pages,
      required this.rating,
      required this.price,
      required this.isbn13,
      required this.isbn10,
      required this.publisher,
      required this.year,
      required this.desc,
      required this.image,
      required this.url,
      required this.pdf})
      : super(key: key);

  launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Book Detail"),
          actions: [
            IconButton(
                icon: const Icon(Icons.launch),
                onPressed: () {
                  launchURL(url);
                })
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: image,
                width: (MediaQuery.of(context).size.width) * 0.9,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
              width: (MediaQuery.of(context).size.width) * 0.9,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(subtitle,
                  style: const TextStyle(
                    fontSize: 24,
                  )),
              width: (MediaQuery.of(context).size.width) * 0.9,
            ),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 5.0),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(authors,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              width: (MediaQuery.of(context).size.width) * 0.9,
            ),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 15.0),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text("Description:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              width: (MediaQuery.of(context).size.width) * 0.9,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(desc,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
              width: (MediaQuery.of(context).size.width) * 0.9,
            ),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 15.0),
            ),
            Row(children: [
              const Text("Year: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(year,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ]),
            Row(children: [
              const Text("Pages: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(pages,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ]),
            Row(children: [
              const Text("Publisher: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(publisher,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ]),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 15.0),
            ),
            Row(children: [
              const Text("ISBN-10: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(isbn10,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ]),
            Row(children: [
              const Text("ISBN-13: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(isbn13,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
            ]),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 15.0),
            ),
            Row(children: [
              const Text("Excerpts: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                  children: (pdf.entries.map((entry) {
                var w = IconButton(
                    icon: const Icon(Icons.picture_as_pdf),
                    onPressed: () {
                      launchURL(entry.value);
                    });
                return w;
              }).toList())
                          .isNotEmpty
                      ? pdf.entries.map((entry) {
                          var w = IconButton(
                              icon: const Icon(Icons.picture_as_pdf),
                              onPressed: () {
                                launchURL(entry.value);
                              });
                          return w;
                        }).toList()
                      : [
                          const Text("not available",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ]),
            ]),
            const Padding(
              // Even Padding On All Sides
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(children: [
              Text(price,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              RatingBar.builder(
                initialRating: double.parse(rating),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 35.0,
                onRatingUpdate: (rating) {},
                //itemPadding: EdgeInsets.only(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ]),
            Container(
              margin: const EdgeInsets.only(bottom: 15.0),
            )
          ],
        ));
  }
}
