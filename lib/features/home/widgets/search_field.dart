import 'package:book_shop_app/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (query) {
        Navigator.of(context)
            .pushNamed(SearchScreen.routeName, arguments: query);
      },
      textAlign: TextAlign.center,
      style: GoogleFonts.workSans(),
      decoration: InputDecoration(
        label: Center(
          child: Text(
            'Search',
            style: GoogleFonts.workSans(),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
