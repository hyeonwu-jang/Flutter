import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_favorite_restaurant/restaurant/view/my_restaurant.dart';
import 'package:my_favorite_restaurant/user/view/login_screen.dart';
import 'package:my_favorite_restaurant/user/view/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginScreen(),
      routes: [
        GoRoute(
          path: "SignUp",
          builder: (context, state) => SignUpScreen(),
        )
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'a',
      debugShowCheckedModeBanner: false,
      routerConfig: _goRouter,
    );
  }
}
