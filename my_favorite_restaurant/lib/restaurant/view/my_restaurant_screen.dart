import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class MyRestaurantScreen extends StatelessWidget {
  const MyRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/main/add");
        },
        child: Icon(Icons.add),
      ),
      child: Center(
        child: Text('a'),
      ),
    );
  }
}
