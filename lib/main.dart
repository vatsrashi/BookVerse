import 'dart:io';

import 'package:book_shop_app/features/home/screens/home_screen.dart';
import 'package:book_shop_app/models/book_model.dart';
import 'package:book_shop_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import './router.dart';
import 'models/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<CartModel>('cart');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shop App',
      theme: ThemeData.light(),

      // home: BookDetailScreen(
      //   book: Book.fromJson(Constants.bookJson[48]),
      // ),
      home: const HomeScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
