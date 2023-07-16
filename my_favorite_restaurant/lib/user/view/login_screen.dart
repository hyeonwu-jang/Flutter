import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_favorite_restaurant/common/component/main_logo.dart';
import 'package:my_favorite_restaurant/common/layout/default_layout.dart';
import 'package:my_favorite_restaurant/user/model/user_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.orange[300],
      child: Column(
        children: [
          Container(
            child: MainLogo(),
            height: MediaQuery.of(context).size.height / 1.5,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: 55,
                  child: InkWell(
                    highlightColor: Colors.amber[900],
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    onTap: () async {
                      UserCredential userCredential = await signInWithGoogle();
                      final user = UserModel(
                        displayName: userCredential.user?.displayName,
                        email: userCredential.user?.email,
                      );
                      await FirebaseFirestore.instance.collection("user").doc(userCredential.user!.uid).set(user.toJson());

                      if(context.mounted) {
                        context.go("/main");
                      }
                    },
                    child: Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Ink.image(
                              image: AssetImage("assets/images/g_icon.png"),
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Sign In With Google',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow -
    // 로그인 화면 표출 -> 로그인 시 googleUser에 로그인한 사용자 정보 저장
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    // 로그인한 사용자의 인증 정보를 가져와서 googlAuth에 저장
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    // Google 인증 자격명인 crendential 생성 ->
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // Firebase 인증 서비스 사용 -> UserCredential 반환
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
}
