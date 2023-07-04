import 'package:flutter/material.dart';

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
        // enabledBorder: OutlineInputBorder(  // 기본적으로 보여지는 라인
        //   borderRadius: BorderRadius.circular(32.0),
        //   borderSide: BorderSide(
        //     color: Colors.black,
        //     width: 1.0
        //   )
        // ),
        errorText: errorText,

      ),
      onChanged: onChanged,
    );
  }
}
