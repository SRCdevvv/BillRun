import 'package:bilrun/widgets/main_drawer.dart';
import 'package:bilrun/widgets/search/search_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/screens/Rent/rent_controller.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/screens/Rent/rent_product_list.dart';



void main()=>runApp(RentMain());

class RentMain extends StatefulWidget {

  RentMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RentMainState createState() => _RentMainState();
}

class _RentMainState extends State<RentMain> {

  static RentProductController rentProductController = Get.put(RentProductController());






  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child:
        AppBar(

          iconTheme: IconThemeData(
            color: Colors.black,
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

      ),


      body:
      SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                     Expanded(
                      child: ListView(

                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          OriginDivider(Colors.red[900], 100, 0, 0),
                          Positioned(
                            top: 102,
                              bottom: 614,
                              left:24 ,
                              right: 142,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                     child: NowLocation(),
                                    ),

                                     Text(
                                        '지금 빌려주세요!',
                                        style: TextStyle(
                                            fontSize: 22, fontWeight: FontWeight.bold),
                                      ),


                                  ],
                                ),
                              ),
                            ),
                          //
                            Obx(()
                            {
                              if (rentProductController.isLoading.value)
                                return Center(child: CircularProgressIndicator());
                              else

                                return
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: rentProductController.rentProductList.length,


                                      itemBuilder: ( BuildContext context, int index){


                                        print(' 메인: ${rentProductController.rentProductList.value}');
                                        return
                                          RentProductTile(rentProductController.rentProductList[index]);
                                      });
                            }

                            ),


                        ],
                      ),
                    ),



              ],

            ),
          ],
        ),
      ),


      drawer: Drawer(
        child:
        MainDrawer(),
      ),




    );









  }



}

