import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ordinary_age/common/component/banner_ad_widget.dart';

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
            '생년월일과 궁금한 날짜를 입력하고 확인을 눌러주세요',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: 130,
                  child: TextFormField(
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('생년월일 8자리'),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      birth = value;
                    },
                  ),
                ),
              ),
              SizedBox(width: 16.0,),
              Expanded(
                child: Container(
                  width: 130,
                  child: TextFormField(
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('희망 연월일 8자리'),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      ymd = value;
                    },
                  ),
                ),
              ),
              SizedBox(width: 16.0,),
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
          Expanded(child: SizedBox()),
          BannerAdWidget(),
        ],
      ),
    );
  }

  void onPressed() {
    if (birth == null || ymd == null) {
      return;
    }

    setState(() {
      birth = birth;
      ymd = ymd;
    });

    isCal = true;
  }

  String calculate() {
    if (!isCal) {
      return '';
    }

    if(birth!.length < 8 || ymd!.length < 8) {
      return '입력값을 확인해주세요 : (';
    }

    DateTime today = DateTime.now();

    int birthYear = int.parse(birth!.substring(0, 4));
    int birthMonth = int.parse(birth!.substring(4, 6));
    int birthDay = int.parse(birth!.substring(6, 8));

    int ymdYear = int.parse(ymd!.substring(0, 4));
    int ymdMonth = int.parse(ymd!.substring(4, 6));
    int ymdDay = int.parse(ymd!.substring(6, 8));

    int optionYear = 100;
    if
    (
      birthYear < today.year - optionYear || ymdYear < today.year - optionYear ||
      birthYear > today.year + optionYear || ymdYear > today.year + optionYear ||
      birthMonth <= 0 || ymdMonth <= 0 ||
      birthMonth > 12 || ymdMonth > 12 ||
      birthDay <= 0 || ymdDay <= 0 ||
      birthDay > 31 || ymdDay > 31
    ) {
      return '입력값을 확인해주세요 : (';
    }

    DateTime dtBirth = DateTime.parse(birth.toString());
    DateTime dtYmd = DateTime.parse(ymd.toString());
    int age;
    int bonusAge = 1;

    age = dtYmd.year - dtBirth.year;

    if(dtBirth.isAfter(dtYmd)) {
      return '희망연월일은 생년월일 이후이여야 합니다 : (';
    }

    if (dtBirth.month == dtYmd.month && dtBirth.day == dtYmd.day) {
      return '${dtYmd.year}년 ${dtYmd.month}월 ${dtYmd.day}일 당신의 나이는 $age살 입니다 : )\n\n( 예전 라떼 시절의 내 나이 : ${age + 1}세 )';
    }

    // 생일이 지났으면 그대로, 안지났으면 나이 -1
    if(dtBirth.month >= dtYmd.month && dtBirth.day >= dtYmd.day) {
      age = age - bonusAge;
      bonusAge++;
      return '${dtYmd.year}년 ${dtYmd.month}월 ${dtYmd.day}일 당신의 나이는 $age살 입니다 : )\n\n( 예전 라떼 시절의 내 나이 : ${age + 2}세 )';

    }
    return '${dtYmd.year}년 ${dtYmd.month}월 ${dtYmd.day}일 당신의 나이는 $age살 입니다 : )\n\n( 예전 라떼 시절의 내 나이 : ${age + 1}세 )';

  }

}
