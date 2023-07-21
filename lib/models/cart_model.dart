import 'package:hive/hive.dart';

import 'book_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  Book book;

  @HiveField(1)
  int quantity;

  CartModel({required this.book, required this.quantity});
}
