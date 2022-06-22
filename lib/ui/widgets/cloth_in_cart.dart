import 'package:ecommerce_app/models/cart_notifier.dart';
import 'package:ecommerce_app/models/image_model.dart';
import 'package:ecommerce_app/ui/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClothInCart extends StatelessWidget {
  final DataModel data;
  const ClothInCart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              width: 170,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: AssetImage(data.imageName), fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 27,
                ),
                Text(
                  "Size: ${data.size}",
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
                SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    Text(
                      "\€ ",
                      style: TextStyle(color: Colors.orange, fontSize: 26),
                    ),
                    Text(
                      data.price.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    Consumer<CartNotifier>(
                        builder: (BuildContext context, CartNotifier,
                                Widget? child) =>
                            GestureDetector(
                                onTap: () {
                                  CartNotifier.removeOneCloth(data);
                                },
                                child: Icon(Icons.remove_circle_outline))),
                    Consumer<CartNotifier>(
                      builder:
                          (BuildContext context, CartNotifier, Widget? child) =>
                              Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Text(
                          CartNotifier
                              .countList[CartNotifier.cartList.indexOf(data)]
                              .toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Consumer<CartNotifier>(
                        builder: (BuildContext context, CartNotifier,
                                Widget? child) =>
                            GestureDetector(
                                onTap: () {
                                  CartNotifier.addCloth(data);
                                },
                                child: Icon(Icons.add_circle_outline))),
                  ],
                )
              ],
            ),
          ),
          Consumer<CartNotifier>(
            builder: (BuildContext context, CartNotifier, Widget? child) =>
                GestureDetector(
              onTap: () {
                CartNotifier.removeClothCompletely(data);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.close,
                  color: Colors.grey[750],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
