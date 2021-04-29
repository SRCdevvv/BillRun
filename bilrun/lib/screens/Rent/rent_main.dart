import 'package:bilrun/screens/mypage/deal_managemenet/deal_list_controller.dart';
import 'package:bilrun/screens/rent/rent_controller.dart';
import 'package:bilrun/screens/rent/rent_service.dart';
import 'package:bilrun/widgets/main_drawer.dart';
import 'package:bilrun/widgets/search/search_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
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

  RentProductController rentProductController = Get.put(RentProductController());

   Future<Null> refresh() async{
     RentProductListService.fetchRentProducts();
     RentProductController.rentfetchProducts();
     rentProductController = Get.put(RentProductController());

   }






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
      RefreshIndicator(
        onRefresh: refresh,
        child: SafeArea(
          child: Column(
            children: [


                         ListView(

                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            OriginDivider(Colors.red[900], 100, 0, 0),
                           
                                 Padding(
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
                              Obx(()
                              {
                                if (RentProductController.isLoading.value)
                                  return Center(child: CircularProgressIndicator());
                                else

                                  return
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: RentProductController.rentProductList.length,


                                        itemBuilder: ( BuildContext context, int index){

                                          return Column(
                                          children: [

                                          RentProductTile(RentProductController.rentProductList[index]),
                                            Container(height: 1, color: Color(0xffdedede),width: Get.width * 0.867,),

                                          ]
                                          );

                                        });
                              }

                              ),


                          ],
                        ),




                ],

              ),
          ),
        ),


      drawer: Drawer(
        child:
        MainDrawer(),
      ),




    );









  }



}

