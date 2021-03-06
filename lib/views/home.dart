import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:ringier_test_task/views/widgets/book_card.dart';
import 'package:ringier_test_task/models/book.dart';
import 'package:ringier_test_task/repository/book_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // UI layout
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('IT Books Store');

  final ScrollController scrollController = ScrollController();

  // UI state
  bool isLoading = true;
  bool areResults = false;

  // API
  late List<Book> futureBooks;
  List<Book> listBooks = [];
  String? query;
  int page = 1;

  // Init method
  @override
  void initState() {
    super.initState();
    fetchBook("/new");
  }

  // Text Controller
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // API fetch method
  Future<void> fetchBook(String query) async {
    futureBooks = await BookApi.fetchBook(query);
    setState(() {
      isLoading = false;
      listBooks += futureBooks;
      if (listBooks.isEmpty) {
        areResults = false;
      } else {
        areResults = true;
      }
    });
  }

  fetchNextPage() {
    if (searchController.text != "") {
      fetchBook("/search/" + searchController.text + "/" + page.toString());
      page += 1;
    } else {
      page = 1;
    }
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
                        controller: searchController,
                        onSubmitted: (text) {
                          listBooks = [];
                          if (searchController.text != "") {
                            fetchBook("/search/" +
                                searchController.text +
                                "/" +
                                page.toString());
                            page += 1;
                          } else {
                            fetchBook("/new");
                          }
                          setState(() {
                            customIcon = const Icon(Icons.search);
                            customSearchBar = const Text('IT Books Store');
                          });
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
            : Scrollbar(
                isAlwaysShown: true,
                controller: scrollController,
                child: LazyLoadScrollView(
                  onEndOfPage: () => {fetchNextPage()},
                  child: areResults
                      ? ListView.builder(
                          controller: scrollController,
                          itemCount: listBooks.length,
                          itemBuilder: (context, index) {
                            return BookCard(
                              title: listBooks[index].title,
                              subtitle: listBooks[index].subtitle,
                              image: listBooks[index].image,
                              isbn13: listBooks[index].isbn13,
                              price: listBooks[index].price,
                            );
                          },
                        )
                      : const Center(child: Text("No results were found")),
                ),
              ));
  }
}
