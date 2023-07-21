import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../models/book_model.dart';
import '../../book_details/screens/book_detail_screen.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final Book book;
  void navigateToBookDetail(BuildContext context) {
    Navigator.of(context)
        .pushNamed(BookDetailScreen.routeName, arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToBookDetail(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Constants.pinkColor,
                      ),
                    ),
                imageUrl: book.coverImageUrl,
                width: 200,
                height: 100),
            Text(
              book.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.workSans(
                  color: Constants.pinkColor, fontWeight: FontWeight.bold),
            ),
            Text('Mark Siegel',
                style: GoogleFonts.workSans(color: Constants.black63)),
          ],
        ),
      ),
    );
  }
}
