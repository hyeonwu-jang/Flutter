import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: ElevatedButton(
          child: Text('로그아웃'),
          onPressed: () async {
            await GoogleSignIn().signOut();
            context.go("/");
          }
        ),
      ),
    );
  }
}
