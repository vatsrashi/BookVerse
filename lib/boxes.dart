import 'package:hive/hive.dart';

import 'models/cart_model.dart';

class Boxes {
  static Box<CartModel> getCartItems() => Hive.box<CartModel>('cart');
}
