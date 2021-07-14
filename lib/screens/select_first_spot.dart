import 'package:flutter/material.dart';

class SelectFirstSpot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _searchBar(titleHolder: "골프장 이름을 입력하시오"),
          Text("saddfsdfsadf")
        ],
      ),
    );
  }
}

Widget _searchBar({titleHolder}) {
  return Text(titleHolder);
}
