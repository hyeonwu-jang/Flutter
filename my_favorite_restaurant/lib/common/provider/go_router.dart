import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_favorite_restaurant/common/view/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final Listenable

  return GoRouter(
    routes: [],
    initialLocation: "/splash",
    refreshListenable: tempListener,
    redirect: (context, state) => "/",
  );
});
