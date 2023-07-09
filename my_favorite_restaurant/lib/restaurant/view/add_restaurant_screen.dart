import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "나만의맛집 추가",
      child: Center(
        child: Text('추가화면'),
      ),
    );
  }
}
