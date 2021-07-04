import 'package:flutter/material.dart';

class NowCommunity extends StatefulWidget {
  @override
  _NowCommunity createState() => _NowCommunity();
}

class _NowCommunity extends State<NowCommunity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(20, 0, 5, 5)),
        Icon(Icons.location_on, color: Color(0xffaa0000), size: 22.0),
        // 자양1동
        Text("한양대학교 ",
            style: const TextStyle(
                color: const Color(0xffaa0000),
                fontWeight: FontWeight.w700,
                fontFamily: "NotoSansCJKkr",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ],
    );
  }
}
