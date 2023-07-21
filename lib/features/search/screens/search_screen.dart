import 'package:book_shop_app/constants/constants.dart';
import 'package:book_shop_app/features/search/services/search_service.dart';
import 'package:book_shop_app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/widgets/book_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.query});
  static const String routeName = '/search-screen';
  final String query;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchService searchService = SearchService();
  List<Book> searchedBooks = [];

  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    search(widget.query);
    _searchController.text = widget.query;
  }

  void search(String query) {
    setState(() {
      searchedBooks = searchService.search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios,
                        size: 30, color: Constants.pinkColor),
                  ),
                  Expanded(
                      flex: 5,
                      child: TextFormField(
                        onChanged: search,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.workSans(),
                        controller: _searchController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            searchedBooks.isEmpty
                ? Text('No Books Found',
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.bold))
                : Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchedBooks.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return BookCard(
                              book: searchedBooks[index],
                            );
                          },
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
