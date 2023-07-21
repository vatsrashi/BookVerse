import 'package:badges/badges.dart' as badges;
import 'package:book_shop_app/constants/constants.dart';
import 'package:book_shop_app/features/book_details/widgets/custom_button.dart';
import 'package:book_shop_app/features/cart/screens/cart_screen.dart';
import 'package:book_shop_app/models/cart_model.dart';
import 'package:book_shop_app/providers/cart_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../boxes.dart';
import '../../../models/book_model.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.book});
  static const routeName = '/book-detail-screen';
  final Book book;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  void navigateToCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  Box<CartModel> box = Boxes.getCartItems();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => navigateToCartScreen(context),
                icon: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Constants.pinkColor,
                  ),
                  position: badges.BadgePosition.bottomEnd(),
                  badgeContent: Text(Provider.of<CartProvider>(context)
                      .numberOfBooks
                      .toString()),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                    color: Constants.pinkColor,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Constants.pinkColor,
              ),
            )),
        body: ValueListenableBuilder(
          valueListenable: Boxes.getCartItems().listenable(),
          builder: (context, value, _) {
            final cart = Boxes.getCartItems().values.toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Constants.pinkColor,
                          ),
                        ),
                        imageUrl: widget.book.coverImageUrl,
                        fit: BoxFit.scaleDown,
                        width: 250,
                        height: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.book.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.workSans(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Mark Siegel',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.workSans(
                              fontSize: 20, color: Constants.black63),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'In the epic conclusion to the 5 Worlds series, the final battle looms In the epic conclusion to the 5 Worlds series, the final battle looms...',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.workSans(
                              fontSize: 20, color: Constants.black63),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${widget.book.priceInDollar}',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.workSans(
                        fontSize: 50,
                        color: Constants.pinkColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    book: widget.book,
                    cart: cart,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
