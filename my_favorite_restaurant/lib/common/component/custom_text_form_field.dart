import 'package:flutter/material.dart';

/* 
  CustomTextFormField 공용 위젯
  params :
    ValueChanged onChanged - 값이 변화할 때 처리할 함수,
    bool obscureText - 비밀번호로 처리 여부,
    String errorText - 에러 시 텍스트,
    String hintText - 텍스트폼 설명 문구
*/

class CustomTextFormField extends StatelessWidget {
  final ValueChanged onChanged;
  final bool obscureText;
  final String? errorText;
  final String? hintText;

  const CustomTextFormField({
    required this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.hintText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.0
        ),
        border: OutlineInputBorder(   // 폼을 선택했을 때 생기는 라인
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide(
            color: Colors.black,
            width: 55.0,
          )
        ),
        errorText: errorText,

      ),
      onChanged: onChanged,
    );
  }
}
