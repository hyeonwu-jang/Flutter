import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_favorite_restaurant/common/view/splash_screen.dart';
import 'package:my_favorite_restaurant/firebase_options.dart';
import 'package:my_favorite_restaurant/restaurant/view/add_restaurant_screen.dart';
import 'package:my_favorite_restaurant/restaurant/view/root_tab.dart';
import 'package:my_favorite_restaurant/user/view/login_screen.dart';
import 'package:my_favorite_restaurant/user/view/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => RootTab(),
      routes: [
        GoRoute(
          path: "add",
          builder: (context, state) => AddRestaurantScreen(),
        ),
      ],
    ),
    GoRoute(
      path: "/splash",
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/sign_up",
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: "/sign_in",
      builder: (context, state) => LoginScreen(),
    )
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
