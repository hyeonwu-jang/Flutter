import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  final String title = "나만의맛집";
  final String subTitle = "기억하고 싶은 맛집의 메뉴를 기록하고 공유해요";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.orange[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Icon(
                Icons.food_bank_rounded,
                color: Colors.white,
                size: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize:
                    (MediaQuery.of(context).size.width / title.length) * 0.7,
              ),
            ),
          ),
          Center(
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize:
                    (MediaQuery.of(context).size.width / subTitle.length) * 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
