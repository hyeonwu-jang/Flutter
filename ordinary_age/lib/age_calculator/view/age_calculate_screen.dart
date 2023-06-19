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
            '생년월일을 입력하세요',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
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
                child: Text('검사'),
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
    if (birth?.length != 8) {
      return '생년월일을 확인해주세요 : (';
    }

    DateTime dtBirth = DateTime.parse(birth!);
    int age;
    int bonusAge = 1;

    age = todayDate.year - dtBirth.year;

    if(dtBirth.month == todayDate.month && dtBirth.day == todayDate.day) {
      return '생일을 진심으로 축하드립니다!!! \n오늘부터 $bonusAge살 젊어진 $age살이시네요 : )';
    }

    // DateTime 보정 막기..
    if
    (
      dtBirth.year <= 1900 || dtBirth.year > todayDate.year ||
      dtBirth.month <= 0 || dtBirth.month > 12 ||
      dtBirth.day <= 0 || dtBirth.day > 31
    ) {
      return '생년월일을 확인해주세요 : (';
    }

    print(dtBirth.year);
    print(dtBirth.month);
    print(dtBirth.day);

    // 생일이 안지났으면 -1, 지났으면 그대로
    if (dtBirth.month <= todayDate.month && dtBirth.day <= todayDate.day) {
      age -= 1;
      bonusAge = 2;
    }

    if(age < 0) {
      age = 0;
      return '${todayDate.year}년 당신의 나이는 $age살 입니다.';

    } else if(age > 130) {
      return '생년월일을 확인해주세요 : (';
    }

    return '${todayDate.year}년 당신의 나이는 $age살 입니다.\n축하드립니다. ${bonusAge == 2? '$bonusAge살이나 젊어지셨네요 > <' : '$bonusAge살 젊어지셨네요 : )'}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Center(
        child: Text(
          translateAge(birth, todayDate),
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
