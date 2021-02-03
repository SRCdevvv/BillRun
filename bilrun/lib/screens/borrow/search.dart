import 'package:flutter/material.dart';

void main() => runApp(SearchbarApp());

class SearchbarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'searchbar',
      home: SearchbarScreen(),
    );
  }
}

class SearchbarScreen extends StatefulWidget {
  @override
  _SearchbarScreenState createState() => _SearchbarScreenState();
}

class _SearchbarScreenState extends State<SearchbarScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: _buildTextComposer(),
      ),
      );


  }


  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 280,

                child:  TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: "검색어를 입력하세요."),
                ),
                ),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ),

            ],
          ),
        )


    );
  }
  void _handleSubmitted(String text) {
    _textController.clear();
  } }


