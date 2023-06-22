import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AgeCalculateScreen extends StatefulWidget {
  const AgeCalculateScreen({Key? key}) : super(key: key);

  @override
  State<AgeCalculateScreen> createState() => _AgeCalculateScreenState();
}

class _AgeCalculateScreenState extends State<AgeCalculateScreen> {
  String? birth;
  bool isCal = false;

  @override
  void initState() {
    super.initState();

    birth = '';
  }

  @override
  Widget build(BuildContext context) {
    final todayDate =
        DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(
            '생년월일 8글자를 입력하고 확인을 눌러주세요',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    birth = value;
                  },
                  decoration: InputDecoration(
                    label: Text(
                        '예시) $todayDate'.substring(0, 14).replaceAll("-", "")),
                  ),
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    return (value == null || value.length < 8)
                        ? '생년월일을 확인해주세요'
                        : null;
                  },
                  maxLength: 8,
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('확인'),
              ),
            ],
          ),
          if (isCal)
            _DateTranslateText(
              birth: birth,
              todayDate: todayDate,
            ),
        ],
      ),
    );
  }

  void onPressed() {
    if (birth != '') {
      isCal = true;
    }

    setState(() {
      birth = birth;
    });
  }
}

class _DateTranslateText extends StatelessWidget {
  final String? birth;
  final DateTime todayDate;

  const _DateTranslateText({
    this.birth,
    required this.todayDate,
    Key? key,
  }) : super(key: key);

  String translateAge(String? birth, DateTime todayDate) {

    // 8글자 미만
    if (birth!.length < 8) {
      return '생년월일을 확인해주세요 : (';
    }

    int birthYear = int.parse(birth.substring(0, 4));
    int birthMonth = int.parse(birth.substring(4, 6));
    int birthDay = int.parse(birth.substring(6, 8));

    if
    (
      birthYear <= 1900 ||
      birthYear > todayDate.year ||
      birthMonth <= 0 ||
      birthMonth > 12 ||
      birthDay <= 0 ||
      birthDay > 31
    )
    {
      return '생년월일을 확인해주세요 : (';
    }

    DateTime dtBirth = DateTime.parse(birth);
    int age;
    int bonusAge = 1;

    age = todayDate.year - dtBirth.year;

    if(dtBirth.isAfter(todayDate)) {
      return '유효하지 않은 생년월일입니다 : (\n\n신생아는 출생년도 기준 0살이며,\n생일인 날부터 1살이 됩니다.';
    }

    if (dtBirth.month == todayDate.month && dtBirth.day == todayDate.day) {
      return '생일을 진심으로 축하드립니다!!!\n${todayDate.year}년 현재 당신의 나이는 $age살 입니다 : )\n\n( 예전 라떼 시절의 내 나이 : ${age + 1}세 )';
    }

    // 생일이 지났으면 그대로, 안지났으면 나이 -1
    if(dtBirth.month >= todayDate.month && dtBirth.day >= todayDate.day) {
      age = age - bonusAge;
      bonusAge++;
      return '${todayDate.year}년 현재 당신의 나이는 $age살 입니다. \n생일이신 ${dtBirth.month}월 ${dtBirth.day}일부터 ${age + 1}살 입니다 : )\n\n( 예전 라떼 시절의 나이 : ${age + 2}세 )';

    }
    return '${todayDate.year}년 현재 당신의 나이는 $age살 입니다 : )\n\n( 예전 라떼 시절의 내 나이 : ${age + 1}세 )';

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Center(
        child: Text(
          translateAge(birth, todayDate),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
