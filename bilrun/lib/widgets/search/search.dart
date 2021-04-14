import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchbarScreen extends StatefulWidget {
  @override
  _SearchbarScreenState createState() => _SearchbarScreenState();
}

class _SearchbarScreenState extends State<SearchbarScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              color: Colors.black,
              iconSize: 40.0,
              onPressed: () => { Get.back()},
            ),
          ),
          title: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "검색",
              style: TextStyle(color: Colors.black, fontSize: 28.0),
            ),
          ),
          centerTitle: false,
        ),
        body:SafeArea(
          child: _buildTextComposer(),

        )

      );


  }


  Widget _buildTextComposer() {
    return Column(

        children: <Widget>[

          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 20, 5, 10),
                width: Get.width -100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '검색어를 입력하세요.',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search,size: 30,),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ),


            ],
          ),



        ],



    );



  }
  void _handleSubmitted(String text) {
    _textController.clear();
  } }


