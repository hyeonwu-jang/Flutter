import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/component/main_logo.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.orange[300],
      child: MainLogo(),
    );
  }
}
