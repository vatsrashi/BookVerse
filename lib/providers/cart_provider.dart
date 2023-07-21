import 'package:book_shop_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../boxes.dart';
import '../models/book_model.dart';

class CartProvider extends ChangeNotifier {
  Box<CartModel> box = Boxes.getCartItems();
  int quantity(Book book) => box.get(book.title)!.quantity;

  void addBook(Book book) async {
    if (box.get(book.title) != null) {
      int quantity = this.quantity(book);
      await box.put(book.title, CartModel(book: book, quantity: quantity + 1));
    } else {
      await box.put(book.title, CartModel(book: book, quantity: 1));
    }
    notifyListeners();
  }

  int get numberOfBooks => box.length;
  void removeBook(Book book) async {
    int quantity = this.quantity(book);
    if (quantity == 1) {
      clearBook(book);
    } else {
      await box.put(book.title, CartModel(book: book, quantity: quantity - 1));
    }
    notifyListeners();
  }

  double get subTotal {
    double subTotal = 0;
    for (int i = 0; i < box.length; i++) {
      subTotal += box.getAt(i)!.book.priceInDollar * box.getAt(i)!.quantity;
    }
    return double.parse(subTotal.toStringAsFixed(4));
  }

  void clearBook(Book book) async {
    box.delete(book.title);
    notifyListeners();
  }

  void clearCart() async {
    await box.clear();
    notifyListeners();
  }
}
