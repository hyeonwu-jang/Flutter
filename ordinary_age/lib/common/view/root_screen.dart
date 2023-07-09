import 'package:flutter/material.dart';
import 'package:ordinary_age/age_calculator/view/age_calculate_screen.dart';
import 'package:ordinary_age/age_calculator/view/age_dday_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff535b90),
        title: Text('2023 만나이 계산기'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          AgeCalculateScreen(),
          AgeDdayScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: controller!.index,
        onTap: (int index) {
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_emergency,
            ),
            label: '현재의 나이',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
            ),
            label: '과거 또는 미래의 나이',
          ),
        ],
      ),
    );
  }

}
