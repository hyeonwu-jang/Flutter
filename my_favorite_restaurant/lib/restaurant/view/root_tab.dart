import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';
import 'package:my_favorite_restaurant/common/view/splash_screen.dart';
import 'package:my_favorite_restaurant/map/view/map_with_list_screen.dart';
import 'package:my_favorite_restaurant/restaurant/view/my_restaurant_screen.dart';
import 'package:my_favorite_restaurant/user/view/my_page_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '나만의맛집',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          MyRestaurantScreen(),
          MapWithListScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "나의 맛집",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "둘러보기",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "마이페이지",
          ),
        ],
      ),

    );
  }
}
