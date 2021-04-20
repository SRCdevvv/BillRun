import 'package:bilrun/screens/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:bilrun/screens/product_detail/modal_bottom_sheet.dart';
import 'package:bilrun/widgets/banner.dart';
import 'package:bilrun/screens/product_detail/detail_screen_info.dart';


void main() => runApp(DetailScreen());




class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.title}) : super(key:key);

  String title;


  @override
  _DetailScreenState createState() => _DetailScreenState();
}




class _DetailScreenState extends State<DetailScreen> {


  final  DetailProductController detailProductController = Get.put(DetailProductController());




  @override
  Widget build(BuildContext context) {
    // print('메인 : ${lendDetailController.productList.value.name}');
    final ProductDetailInfo = detailProductController.productList.value;



    switch(ProductDetailInfo.priceProp){
      case "1h" :
        ProductDetailInfo.priceProp = '시간';
        break;
      case "30m" :
        ProductDetailInfo.priceProp = '30분';
        break;
      case "Day" :
        ProductDetailInfo.priceProp = '일';
        break;
    }

    String cost = ProductDetailInfo.price;
    String priceProp = ProductDetailInfo.priceProp;
    int IdOfProduct= ProductDetailInfo.id;





    return MaterialApp(
      home:Scaffold(
          body: SafeArea(
            child: Column(

              children: <Widget>[
                Container(
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        //TODO  배너 상품에 맞게 크기랑 세부 디자인 적용하기

                        Stack(
                          children: <Widget>[
                            BannerWidget(),
                            Positioned(
                              child:IconButton(
                                  iconSize : 40.0,
                                  icon: Icon(Icons.arrow_back),
                                  color:  Colors.white,
                                  onPressed: ()=>{
                                    Get.back()
                                  }
                              ),
                              left: 5,
                            ),
                            Positioned(
                              child:IconButton(
                                  iconSize : 40.0,
                                  icon: Icon(Icons.more_vert),
                                  color:  Colors.white,
                                  onPressed: ()=>{
                                    showMaterialModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => ModalFit(),
                                    )
                                  }
                              ),
                              right: 5,
                            ),
                          ],
                        ),

                        Container(
                          child: Obx(()
                          {
                            //TODO 로딩 모양 바꾸기
                            if(detailProductController.isLoading.value)
                              return Container(child: CircularProgressIndicator());
                            else
                              return
                                DetailScreenInfo(detailProductController.productList.value);


                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //TODO 새로고침해야지 데이터가 불러와지는 현상 고치기
          
          bottomNavigationBar:

          ProductbottomBarWidget( '$cost 원', '$priceProp', IdOfProduct)




      ),
    );
  }
}













