import 'package:bilrun/design/red_divider.dart';
import 'package:flutter/material.dart';
import '../../widgets/billrun_appbar.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import '../../widgets/search.dart';
import 'rent_product_list.dart';

void main() => runApp(RentMainScreen());

class RentMainScreen extends StatefulWidget {
  @override
  _RentMainScreenState createState() => _RentMainScreenState();
}

class _RentMainScreenState extends State<RentMainScreen> {
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RedDivider(),
                        Row(
                          children: <Widget>[
                            NowLocation(),
                            Container(
                                //TODO 위치정보 불러오기

                                ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 40, 10),
                              child: Container(
                                child: Text(
                                  '지금 빌려주세요!',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
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
