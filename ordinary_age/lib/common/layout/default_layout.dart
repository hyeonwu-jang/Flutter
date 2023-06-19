import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const DefaultLayout({
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? _renderAppBar() {
    if (title != null)
      return AppBar(
        title: Text(
          title!,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  }
}
