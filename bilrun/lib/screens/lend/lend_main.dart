import 'package:bilrun/widgets/location/now_location.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/design/divider_example.dart';

//빌려드림

void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

class _LendMainScreenState extends State<LendMainScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: BillrunAppbar(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        OriginDivider(Colors.red[900],10,0,0),
                        //TODO 여백 없애기
                        Stack(
                          children: <Widget>[
                            BannerWidget(),
                          ],
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: NowLocation(),
                              ),
                              Text(
                                '지금 빌려드려요!',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
//TODO 빌려드림 목록으로 바꾸기(데이터 연결)
                        GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                            10,
                            (index) {
                              return Center(
                                child: Text(
                                  'Item $index',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
