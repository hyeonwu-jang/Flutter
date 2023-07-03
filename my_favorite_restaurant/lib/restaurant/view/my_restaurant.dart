import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class MyRestaurant extends StatelessWidget {
  const MyRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '나만의맛집',
      child: Center(
        child: Text('a'),
      ),
    );
  }
}
