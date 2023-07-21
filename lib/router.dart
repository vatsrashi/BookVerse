import 'package:book_shop_app/features/book_details/screens/book_detail_screen.dart';
import 'package:book_shop_app/features/cart/screens/cart_screen.dart';
import 'package:book_shop_app/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import './features/home/screens/home_screen.dart';
import 'models/book_model.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case BookDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => BookDetailScreen(
          book: routeSettings.arguments as Book,
        ),
      );
    case SearchScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => SearchScreen(
          query: routeSettings.arguments as String,
        ),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CartScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('No route!')),
        ),
      );
  }
}
