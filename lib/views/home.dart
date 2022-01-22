import 'package:flutter/material.dart';
import 'package:ringier_test_task/views/widgets/book_card.dart';
import 'package:ringier_test_task/models/book.dart';
import 'package:ringier_test_task/models/book.api.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('IT Books Store');
  String query = "/new";

  late List<Book> futureBooks;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBook(query);
  }

  final SearchController = TextEditingController();

  @override
  void dispose() {
    SearchController.dispose();
    super.dispose();
  }

  Future<void> fetchBook(String query) async {
    futureBooks = await BookApi.fetchBook(query);
    setState(() {
      isLoading = false;
    });
  }

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

                  customSearchBar = ListTile(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      controller: SearchController,
                      onSubmitted: (text) {
                        if (SearchController.text != "") {
                          String query = "/search/" + SearchController.text;
                          fetchBook(query);
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'type in book name...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : LazyLoadScrollView(
              onEndOfPage: () => fetchBook(query),
              child: ListView.builder(
                itemCount: futureBooks.length,
                itemBuilder: (context, index) {
                  return BookCard(
                    title: futureBooks[index].title,
                    subtitle: futureBooks[index].subtitle,
                    image: futureBooks[index].image,
                    isbn13: futureBooks[index].isbn13,
                    price: futureBooks[index].price,
                  );
                },
              ),
            ),
    );
  }
}
