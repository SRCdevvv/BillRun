import 'package:flutter/material.dart';
import '../../widgets/billrun_appbar.dart';
import '../../screens/borrow/search.dart';
import 'lend_product_list.dart';

void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

class _LendMainScreenState extends State<LendMainScreen> {
  final TextEditingController _textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Text("BILL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),
        ),
      ),
        body:Column(
          children: <Widget> [
        Container(
        child: Expanded(
            child: ListView(

            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(8.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: IconTheme(
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


              ),

                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                child: Container(
                  child: Text(
                    '무엇이든 빌려보세요!',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                ),
              ),





          ],
          ),
          ),
          ),





      ],
          ),
          );





  }
  void _handleSubmitted(String text) {
    _textController.clear();

  }

}
