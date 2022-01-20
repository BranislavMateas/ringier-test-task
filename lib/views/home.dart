import 'package:flutter/material.dart';
import 'package:ringier_test_task/views/widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('IT Books Store');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);

                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'type in book name...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      autofocus: true,
                      cursorColor: Colors.white,
                      cursorWidth: 2,
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('IT Books Store');
                }
              });
            },
            icon: customIcon,
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: const [
          BookCard(
            title: r"Designing Across Senses",
            subtitle: r"A Multimodal Approach to Product Design",
            image: r"https://itbook.store/img/books/9781491954249.png",
            isbn13: r"9781491954249",
            price: r"$27.59",
          ),
        ],
      ),
    );
  }
}
