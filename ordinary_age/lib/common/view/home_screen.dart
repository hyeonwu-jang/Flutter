import 'package:flutter/material.dart';
import 'package:ordinary_age/age_calculator/view/age_calculate_screen.dart';
import 'package:ordinary_age/common/layout/default_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '만 나이 계산기',
      child: AgeCalculateScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_emergency,
            ),
            label: '만 나이 계산',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
            ),
            label: '만 나이 D-day',
          ),
        ],
      ),
    );
  }

}
