class BookDetail {
  final String title;
  final String subtitle;
  final String price;
  final String rating;
  final String pages;
  final String isbn13;
  final String isbn10;
  final String authors;
  final String publisher;
  final String year;
  final String desc;
  final String image;
  final String url;
  final Map pdf;

  const BookDetail(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.rating,
      required this.pages,
      required this.isbn13,
      required this.isbn10,
      required this.authors,
      required this.publisher,
      required this.year,
      required this.desc,
      required this.image,
      required this.url,
      required this.pdf});

  factory BookDetail.fromJson(dynamic json) {
    return BookDetail(
      title: json["title"] as String,
      subtitle: json["subtitle"] as String,
      price: json["price"] as String,
      rating: json["rating"] as String,
      pages: json["pages"] as String,
      isbn13: json["isbn13"] as String,
      isbn10: json["isbn10"] as String,
      authors: json["authors"] as String,
      publisher: json["publisher"] as String,
      year: json["year"] as String,
      desc: json["desc"] as String,
      image: json["image"] as String,
      url: json["url"] as String,
      pdf: json["pdf"] as Map,
    );
  }
}
