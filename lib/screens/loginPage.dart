import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golf_forum/viewmodels/kakao_login_view_model.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isKakaoTalkInstalled = false;



  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('kakao Install : ' + installed.toString());

    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  void _checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('isLogin');
    print('================');
    print(result);
    if(result==true){
      //todo 메인으로 이동
      Get.toNamed('/main');
    }else{

    }
  }


  @override
  void initState() {
    super.initState();
    _initKakaoTalkInstalled();

    _checkLogin();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kakao Login Test"),
        actions: [],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed:() async{
                bool res = await KakaoLoginModule(isKakaoTalkInstalled: _isKakaoTalkInstalled)
                    .loginWithWhat();
                if(res){
                  //todo 메인 페이지 이동...
                  Get.toNamed('/main');
                }

              },
              child: Text(" Login with talk!!!!")
          ),
        ],
      )),
    );
  }
}
