import 'package:ecommerce_app/ui/screens/cart.dart';
import 'package:ecommerce_app/ui/screens/favorites_screen.dart';
import 'package:ecommerce_app/ui/widgets/selection_button.dart';
import 'package:ecommerce_app/ui/widgets/selection_row.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/ui/widgets/carousel_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SelectionRow(),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Find Your Style",
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
            ),
          ),
          CarouselView()
        ]),
      ),
    );
  }
}
