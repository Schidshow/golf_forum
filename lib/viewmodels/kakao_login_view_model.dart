import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KakaoLoginModule {
  final bool isKakaoTalkInstalled;
  final _firestore = FirebaseFirestore.instance;

  KakaoLoginModule({required this.isKakaoTalkInstalled});

   Future<bool> loginWithWhat() async{
    isKakaoTalkInstalled ? await _loginWithTalk() : await _loginWithKakao();
    return true;
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      print('tokkkkkkkkkkkkken = $token');


      final User user = await UserApi.instance.me();
      String _accountEmail = user.kakaoAccount!.email!;
      print(user);


      //todo [1] 먼저 해당 유저 가져오기
      //todo [2] 유저가 있으면 가져온거 그대로 사용! 없으면? 추가(add)

      _firestore.collection('users').where("email", isEqualTo: _accountEmail).get().then((value) {

      });

      _firestore.collection('users').add({
        'email': _accountEmail,
      });


      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin',true);
      await prefs.setString('user_id',user.id.toString());

    } catch (e) {
      print(e.toString());
    }
  }

  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }

  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
    } catch (e) {
      print(e.toString());
    }
  }
}
