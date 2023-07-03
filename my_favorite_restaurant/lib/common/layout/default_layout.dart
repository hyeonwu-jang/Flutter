import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String? title;
  final Widget child;
  final Color? backgroundColor;
  final FloatingActionButton? floatingActionButton;
  final BottomNavigationBar? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.title,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _RenderAppbar(),
      body: child,
      backgroundColor: backgroundColor ?? Colors.white,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? _RenderAppbar() {
    if(title == null) {   // DefaultLayout을 모든 뷰의 디폴트로 사용하기 위해 title이 없는 경우에는 null을 반환하도록 설계
      return null;
    }

    return AppBar(
      title: Text(
        title!
      ),
      backgroundColor: Colors.white,  // 앱바의 배경색
      foregroundColor: Colors.black,  // 앱바의 글자색
      elevation: 0,   // 앱바의 층을 0으로 (그림자효과 등 상단 앱바의 효과가 사라짐)
      centerTitle: true,
    );
  }
}
