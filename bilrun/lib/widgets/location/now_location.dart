import 'package:flutter/material.dart';

class NowLocation extends StatefulWidget {
  @override
  _NowLocation createState() => _NowLocation();
}

//TODO 위치 정보 불러와서 동 표시해주기 ( 빌림, 빌려드림에 표시됨)

class _NowLocation extends State<NowLocation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(20, 0, 5, 5)),
        Icon(Icons.location_on, color: Colors.red[900], size: 35.0),
        Text(
          "사근동",
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ],
    );
  }
}
