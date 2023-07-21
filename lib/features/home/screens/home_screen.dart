import 'package:badges/badges.dart' as badges;
import 'package:book_shop_app/constants/constants.dart';
import 'package:book_shop_app/features/cart/screens/cart_screen.dart';
import 'package:book_shop_app/features/home/widgets/search_field.dart';
import 'package:book_shop_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../boxes.dart';
import '../../../features/home/services/home_services.dart';
import '../../../features/home/widgets/book_card.dart';
import '../../../models/book_model.dart';
import '../../../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToCartScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CartScreen.routeName);
  }

  final HomeServices _homeServices = HomeServices();
  List<Book>? books;
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    books = _homeServices.getAllBooks();
    _searchController = TextEditingController();
  }

  Box<CartModel> box = Boxes.getCartItems();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: SearchField(controller: _searchController)),
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
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: books!.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return BookCard(
                        book: books![index],
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
