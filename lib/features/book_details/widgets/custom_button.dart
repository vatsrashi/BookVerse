import 'package:book_shop_app/models/cart_model.dart';
import 'package:book_shop_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../boxes.dart';
import '../../../constants/constants.dart';
import '../../../models/book_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.book, required this.cart});
  final Book book;
  final List<CartModel> cart;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Box<CartModel> box = Boxes.getCartItems();
  void remove(Book book) {
    Provider.of<CartProvider>(context, listen: false).removeBook(book);
  }

  void add(Book book) {
    Provider.of<CartProvider>(context, listen: false).addBook(book);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.pinkColor,
      ),
      child: box.get(widget.book.title) != null &&
              box.get(widget.book.title)!.quantity > 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      remove(widget.book);
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                Text(box.get(widget.book.title)!.quantity.toString(),
                    style: GoogleFonts.workSans(
                        color: Colors.white, fontSize: 20)),
                IconButton(
                    onPressed: () {
                      add(widget.book);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            )
          : Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  add(widget.book);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Add to Bag',
                  style: GoogleFonts.workSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Constants.pinkColor,
                  backgroundColor: Constants.pinkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
    );
  }
}
