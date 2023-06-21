import 'package:flutter/material.dart';
import 'package:ordinary_age/common/view/root_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
      theme: ThemeData(
        fontFamily: 'PoorStory',
      ),
    );
  }
}

