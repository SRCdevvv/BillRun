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

    return  MaterialApp(
        home:
        Main(),

    );

  }
}

class Main extends StatefulWidget {

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:Container(

          child: ListView(


                children: <Widget> [
                  BillrunAppbar(),
                  BannerWidget(),
                  SearchbarApp(),
                  Product(),

                ]

            ),
        ),



    );
  }
}

