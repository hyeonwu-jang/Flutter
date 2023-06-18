import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthTextForm extends StatefulWidget {
  const BirthTextForm({Key? key}) : super(key: key);

  @override
  State<BirthTextForm> createState() => _BirthTextFormState();
}

class _BirthTextFormState extends State<BirthTextForm> {
  int? birth;
  bool isCal = false;

  @override
  void initState() {
    super.initState();

    birth = 0;
  }

  @override
  Widget build(BuildContext context) {
    final todayDate = DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '생년월일을 입력하세요',
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      birth = int.parse(value);
                    }
                  },
                  decoration: InputDecoration(
                    label: Text('예시) $todayDate'.substring(0,14)),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    return (value == null) ? '생년월일을 확인해주세요' : null;
                  },
                  maxLength: 8,
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    birth = birth;
                    isCal = true;
                  });
                },
                child: Text('계산'),
              ),
            ],
          ),
          if(isCal)
          _DateTranslateText(
            birth: birth!,
            todayDate: todayDate,
          ),
        ],
      ),
    );
  }
}

class _DateTranslateText extends StatelessWidget {
  final int birth;
  final DateTime todayDate;

  const _DateTranslateText({
    required this.birth,
    required this.todayDate,
    Key? key,
  }) : super(key: key);

  int translateAge(int birth, DateTime todayDate) {
    print(birth);
    print(todayDate);

    // DateTime dateTime1 = DateFormat('yyyyMMdd').parse(birth.toString());

    // String 형식의 날짜 값을 DateTime으로 변환
    // DateTime dateTime2 = DateFormat('yyyyMMdd').parse(todayDate);

    // int intTodayDate = int.parse(todayDate);

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final age = translateAge(birth, todayDate);

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: Text(
          '당신의 만 나이는 $age살 입니다',
        ),
      ),
    );
  }
}
