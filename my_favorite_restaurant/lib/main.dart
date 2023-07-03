import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/restaurant/view/my_restaurant.dart';
import 'package:my_favorite_restaurant/user/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'a',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }

}
