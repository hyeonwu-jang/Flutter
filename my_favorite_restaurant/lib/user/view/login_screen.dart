import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/component/custom_text_form_field.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.orange[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '나만의 맛집',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '내가 경험한 찐맛집을 저장하고 공유해요',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Circle(context),
                    _Circle(context),
                    _Circle(context),
                    _Circle(context),
                    _Circle(context),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    hintText: 'id',
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    hintText: 'password',
                    obscureText: true,
                    onChanged: (value) {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('로그인'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('회원가입'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _Circle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Colors.orange,
            width: MediaQuery.of(context).size.width / 14),
      ),
    );
  }
}
