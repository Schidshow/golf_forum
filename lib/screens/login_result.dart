import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/user.dart';

class LoginResult extends StatefulWidget {
  @override
  _LoginResultState createState() => _LoginResultState();
}

class _LoginResultState extends State<LoginResult> {
  @override
  void initState() {
    super.initState();
    _initTexts();
  }

  _initTexts() async {
    final User user = await UserApi.instance.me();

    setState(() {
      _accountEmail = user.kakaoAccount!.email!;
    });
  }

  String _accountEmail = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(_accountEmail),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/selectFirstSpot');
                  },
                  child: Text("gogo"))
            ],
          ),
        ),
      ),
    );
  }
}
