import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AgeDdayScreen extends StatefulWidget {
  const AgeDdayScreen({Key? key}) : super(key: key);

  @override
  State<AgeDdayScreen> createState() => _AgeDdayScreenState();
}

class _AgeDdayScreenState extends State<AgeDdayScreen> {
  String? birth;
  String? ymd;
  bool isCal = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(
            '각각 숫자 8글자를 입력하고 확인을 눌러주세요',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                child: TextFormField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('생년월일'),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    birth = value;
                  },
                ),
              ),
              Container(
                width: 130,
                child: TextFormField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('희망 연월일'),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    ymd = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('확인'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Text(
                calculate(),
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    if (birth == null || ymd == null) {
      return;
    }
    print('$birth $ymd');
    setState(() {
      birth = birth;
      ymd = ymd;
    });

    isCal = true;
  }

  String calculate() {
    if (!isCal) {
      return '입력하신 정보를 확인해주세요 : (';
    }
    final result = '${ymd?.substring(0, 4)} 당신의 ';

    return result;
  }
}
