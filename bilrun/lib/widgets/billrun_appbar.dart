import 'package:flutter/material.dart';
import 'package:bilrun/widgets/search_button.dart';

class BillrunAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            tooltip: 'menu click',
            iconSize: 30.0,
            onPressed: () => {},
          ),
        ),
        backgroundColor: Colors.white,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/images/logo.png', height: 40, width: 100)
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: SearchButton(),
          ),

          //TODO 검색창으로 넘어가도록 네비게이터
        ],
      ),
    );
  }
}
