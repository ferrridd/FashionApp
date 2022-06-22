import 'package:ecommerce_app/models/cart_notifier.dart';
import 'package:ecommerce_app/ui/screens/checkout_screen.dart';
import 'package:ecommerce_app/ui/widgets/cloth_in_cart.dart';
import 'package:ecommerce_app/ui/widgets/price_shower.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_notifier.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "My Cart",
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                children: [
                  Consumer<CartNotifier>(
                    builder:
                        (BuildContext context, CartNotifier, Widget? child) =>
                            ListView.builder(
                      itemBuilder: (context, index) {
                        return ClothInCart(
                          data: CartNotifier.cartList[index],
                        );
                      },
                      itemCount: CartNotifier.cartList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promo/Student code or vouchers",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Consumer<CartNotifier>(
                    builder:
                        (BuildContext context, CartNotifier, Widget? child) =>
                            PriceShower(
                                status: "Sub Total",
                                price: CartNotifier.totalPrice),
                  ),
                  PriceShower(status: "Shipping", price: 10),
                  Divider(
                    thickness: 5,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Consumer<CartNotifier>(
                    builder:
                        (BuildContext context, CartNotifier, Widget? child) =>
                            PriceShower(
                                status: "Total",
                                price: CartNotifier.totalPrice + 10),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.04,
                          horizontal: MediaQuery.of(context).size.width * 0.35),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(21)),
                      child: Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
