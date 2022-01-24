class Book {
  final String title;
  final String subtitle;
  final String image;
  final String isbn13;
  final String price;

  const Book(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.isbn13,
      required this.price});

  factory Book.fromJson(dynamic json, int i) {
    return Book(
      title: json["books"][i]["title"] as String,
      subtitle: json["books"][i]["subtitle"] as String,
      isbn13: json["books"][i]["isbn13"] as String,
      price: json["books"][i]["price"] as String,
      image: json["books"][i]["image"] as String,
    );
  }
}
