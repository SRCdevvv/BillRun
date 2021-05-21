import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CertificationPhone extends StatefulWidget {
  @override
  _CertificationPhoneState createState() => _CertificationPhoneState();
}

class _CertificationPhoneState extends State<CertificationPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () => {Get.back()},
          ),
        ),
        title: Text(
          "전화번호 인증",
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
            child:Column(
              children: [
                Text("전화번호인증 페이지")
              ],
            )
          ),
        ),
      ),



    );
  }
}
