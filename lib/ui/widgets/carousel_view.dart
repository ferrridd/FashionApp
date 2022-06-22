import 'dart:math';
import 'package:ecommerce_app/models/favorite_notifier.dart';
import 'package:ecommerce_app/ui/screens/detailed_cloth_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/image_model.dart';
import 'package:provider/provider.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
                itemCount: imageList.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index);
                }),
          )
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(imageList[index], index),
        );
      },
    );
  }

  Widget carouselCard(DataModel data, int index) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
            child: Stack(alignment: Alignment.topRight, children: [
              Hero(
                tag: data.imageName,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  data: data,
                                  index: index,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Consumer<FavoriteNotifier>(
                builder:
                    (BuildContext context, FavoriteNotifier, Widget? child) =>
                        GestureDetector(
                  onTap: () {
                    FavoriteNotifier.favoriteChanged(index);
                    debugPrint(FavoriteNotifier.indexes.toString());
                    // debugPrint(FavoriteNotifier
                    //     .dataList[FavoriteNotifier.indexes.indexOf(index)].title
                    //     .toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(FavoriteNotifier.isFavoriteList[index]
                        ? Icons.favorite
                        : Icons.favorite_border),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            data.title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                "${data.price}",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          ),
        )
      ],
    );
  }
}
