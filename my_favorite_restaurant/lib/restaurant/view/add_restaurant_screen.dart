import 'package:flutter/material.dart';
import 'package:my_favorite_restaurant/common/component/custom_text_form_field.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "나만의맛집 추가",
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('음식점 검색하기'),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: CustomTextFormField(
                    onChanged: (value) {},
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('음식점 검색'),
                        content: Column(
                          children: [
                            Text('음식점 이름을 입력하고 \n검색 버튼을 누르세요.'),
                            SizedBox(height: 8.0),
                            CustomTextFormField(
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  child: ElevatedButton(
                    child: Text('검색'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
