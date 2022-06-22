import 'package:ecommerce_app/models/favorite_notifier.dart';
import 'package:ecommerce_app/ui/screens/detailed_cloth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/image_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Favorites",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
        ),
        body: Consumer<FavoriteNotifier>(
          builder: (BuildContext context, FavoriteNotifier, Widget? child) =>
              SingleChildScrollView(
                  child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              data: FavoriteNotifier.dataList[index],
                              index: FavoriteNotifier.indexes[index])));
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          FavoriteNotifier.dataList[index].imageName),
                    ),
                    title: Text(FavoriteNotifier.dataList[index].title),
                    subtitle:
                        Text("\€ ${FavoriteNotifier.dataList[index].price}"),
                    trailing: GestureDetector(
                        onTap: () {
                          debugPrint(index.toString());
                          FavoriteNotifier.favoriteChanged(
                              FavoriteNotifier.indexes[index]);
                        },
                        child: Icon(Icons.favorite)),
                  ),
                ),
              );
            },
            itemCount: FavoriteNotifier.dataList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
          )),
        ));
  }
}
