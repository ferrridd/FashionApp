import 'package:ecommerce_app/models/cart_notifier.dart';
import 'package:ecommerce_app/models/favorite_notifier.dart';
import 'package:ecommerce_app/models/selection_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (__) => FavoriteNotifier()),
        ChangeNotifierProvider(create: (__) => CartNotifier()),
        ChangeNotifierProvider(create: (__) => SelectionStateNotifier()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
