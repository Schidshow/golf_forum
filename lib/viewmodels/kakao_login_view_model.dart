import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KakaoLoginModule {
  final bool isKakaoTalkInstalled;
  final _firestore = FirebaseFirestore.instance;

  KakaoLoginModule({required this.isKakaoTalkInstalled});

  Function loginWithWhat() {
    return isKakaoTalkInstalled ? _loginWithTalk() : _loginWithKakao();
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      print('tokkkkkkkkkkkkken = $token');
      Get.toNamed('/login_result');

      final User user = await UserApi.instance.me();
      String _accountEmail = user.kakaoAccount!.email!;
      print(user);

      _firestore.collection('users').add({
        'email': _accountEmail,
      });
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
