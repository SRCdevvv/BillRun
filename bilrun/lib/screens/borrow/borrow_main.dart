import 'package:flutter/material.dart';
import 'search.dart';
import 'banner.dart';
import 'borrow_product_list.dart';
import '../../widgets/billrun_appbar.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body:Column(
                children: <Widget> [
                  BillrunAppbar(),
                  BannerWidget(),
                  SearchbarApp(),
                  Product(),

                ]

            )


        )






    );

  }
}
