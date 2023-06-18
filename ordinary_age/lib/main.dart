import 'package:flutter/material.dart';
import 'package:ordinary_age/screen/home_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '만나이 계산기',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

