import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ordinary_age/common/view/root_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

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
        // primaryColor: Color(0xff535b90),
        primarySwatch: Colors.indigo,
      ),
    );
  }
}

