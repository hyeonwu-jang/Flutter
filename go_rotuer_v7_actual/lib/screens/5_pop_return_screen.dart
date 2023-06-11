import 'package:flutter/material.dart';
import 'package:go_rotuer_v7_actual/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop('code factory');  // 파라미터가 반환딤.
            },
            child: Text('Pop'),
          ),
        ],
      ),
    );
  }
}
