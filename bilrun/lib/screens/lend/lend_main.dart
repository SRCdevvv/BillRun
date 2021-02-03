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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BillrunAppbar(),
          SearchbarApp(),
          LendProductList(),

        ],
      ),
    );
  }
}
