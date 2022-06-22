import 'package:ecommerce_app/models/cart_notifier.dart';
import 'package:ecommerce_app/models/favorite_notifier.dart';
import 'package:ecommerce_app/models/image_model.dart';
import 'package:ecommerce_app/ui/widgets/size_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final DataModel data;
  final int index;
  const DetailsScreen({Key? key, required this.data, required this.index})
      : super(key: key);

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
        actions: [
          Consumer<FavoriteNotifier>(
            builder: (BuildContext context, FavoriteNotifier, Widget? child) =>
                GestureDetector(
              onTap: () {
                FavoriteNotifier.favoriteChanged(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  FavoriteNotifier.isFavoriteList[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      this.data.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\€ ",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "${this.data.price}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ])),
              SizedBox(height: 20),
              Container(
                height: 450,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(data.imageName), fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
              SizeSelection(
                data: this.data,
                index: this.index,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, right: 80),
                    child: Row(
                      children: [
                        Text(
                          "\€ ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Text(
                          data.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Consumer<CartNotifier>(
                    builder:
                        (BuildContext context, CartNotifier, Widget? child) =>
                            InkWell(
                                onTap: () {
                                  if (data.color != Colors.transparent &&
                                      data.size != "") {
                                    CartNotifier.addCloth(data);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please select size and color!")));
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  padding: EdgeInsets.only(
                                      left: 50, right: 50, top: 30, bottom: 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
