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
        title: Text('만 나이 계산기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          AgeCalculateScreen(),
          AgeDdayScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            label: '지금의 나이',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
            ),
            label: '미래의 나이',
          ),
        ],
      ),
    );
  }

}
