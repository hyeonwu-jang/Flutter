import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text('마이페이지'),
      ),
    );
  }
}
