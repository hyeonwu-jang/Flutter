import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class MapWithListScreen extends StatelessWidget {
  const MapWithListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text('맵'),
      ),
    );
  }
}
