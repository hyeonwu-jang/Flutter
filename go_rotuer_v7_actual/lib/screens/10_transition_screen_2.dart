import 'package:flutter/material.dart';
import 'package:go_rotuer_v7_actual/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class TransitionScreenTwo extends StatelessWidget {
  const TransitionScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('POP'),
            ),
          ],
        ),
      ),
    );
  }
}
