import 'package:flutter/material.dart';
import 'widgets/billrun_appbar.dart';
import 'screens/lend/lend_product_list.dart';

void main() => runApp(LendMainScreen());

class LendMainScreen extends StatefulWidget {
  @override
  _LendMainScreenState createState() => _LendMainScreenState();
}

class _LendMainScreenState extends State<LendMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          body: Column(
            children: <Widget> [
              BillrunAppbar(),
              LendProduct(),

            ],
          ),
        )
    );
  }
}
