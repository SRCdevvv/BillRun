import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'rent_controller.dart';
import 'rent_product_list.dart';
import 'package:bilrun/widgets/billrun_appbar.dart';
import 'package:bilrun/model/rent_product_model.dart';


void main()=>runApp(RentMain());

class RentMain extends StatefulWidget {

  RentMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RentMainState createState() => _RentMainState();
}

class _RentMainState extends State<RentMain> {

  final ProductController productController = Get.put(ProductController());






  @override
  Widget build(BuildContext context) {

//TODO 전체 화면 스크롤
    //TODO 오버픽셀 고치기

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child:
          BillrunAppbar(),
        ),
        body:
        SafeArea(
          child:  Column(
            children: [
              OriginDivider(Colors.red[900], 5, 0, 0),
              Row(
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

              Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,0),
                child: Expanded(
                  child: Obx(()
                  {
                    if (productController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else

                      return
                        GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,

                          children: List.generate(
                              productController.rentProductList.length,


                                  (index) {

                                return LendProductTile(productController.rentProductList[index]);
                              }




                          ),


                        );
                  }

                  ),
                ),
              ),
            ],
          ),
        )


    );


  }



}