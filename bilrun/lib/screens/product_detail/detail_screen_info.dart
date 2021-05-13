import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/screens/product_detail/etc_list/etc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/model/product_detail_model.dart';

import 'detail_list.dart';
import 'etc_list/etc_list.dart';



class DetailScreenInfo extends StatelessWidget {

  final DetailProduct product;
  const DetailScreenInfo(this.product);




  @override
  Widget build(BuildContext context) {

    int differenceDay  = int.parse(DateTime.now().difference(product.createdAt).inDays.toString());
    int differenceHours  = int.parse(DateTime.now().difference(product.createdAt).inHours.toString());
    int differenceMinute = int.parse(DateTime.now().difference(product.createdAt).inMinutes.toString());
    EtcProductController etcProductController = Get.put(EtcProductController());

    return
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: mainGrey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,3),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Container(
                child: Text(
                 '${product.name}',
                  //'hey',
                  style: TextStyle(
                      color:  const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle:  FontStyle.normal,
                      fontSize: 20.0),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                // SmallIcon(Icons.access_time),
                // SmallTitle(
                //     differenceDay < 1 ?
                //     differenceHours < 1 ?
                //     differenceMinute < 30 ? "방금 전": "$differenceMinute분 전 " :
                //     "$differenceHours시간 전": " $differenceDay일 전" ,
                //      mainGrey, 10),
                // SmallIcon(Icons.remove_red_eye_outlined),
                // SmallTitle('29', mainGrey, 10),
                // SmallIcon(Icons.favorite_border_rounded),
                // SmallTitle('${product.likeCount}', mainGrey, 10),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,5,5),
                  child: Row(
                    children: [
                      Icon(
                       Icons.access_time,size: 10, color:mainGrey,
                      ),
                      Text(differenceDay < 1 ?
                      differenceHours < 1 ?
                      differenceMinute < 30 ? " 방금 전": " $differenceMinute분 전 " :
                     " $differenceHours시간 전": " $differenceDay일 전" ,style: TextStyle(
                          color:  mainGrey,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle:  FontStyle.normal,
                          fontSize: 10.0),),
                    ],
    ),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,5,5),
                    child: Row(
                    children: [
                    Icon(
                    Icons.remove_red_eye_outlined,size: 10, color:mainGrey,
                    ),
                    Text(" ${product.hits}" ,style: TextStyle(
                    color:  mainGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle:  FontStyle.normal,
                    fontSize: 10.0),),
                    ],
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,5,5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,size: 10, color:mainGrey,
                      ),
                      Text(" ${product.likeCount}" ,style: TextStyle(
                          color:  mainGrey,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle:  FontStyle.normal,
                          fontSize: 10.0),),
                    ],



                            ),
                ),

              ],
            ),

            OriginDivider(lightGrey, 1, 30, 30),
            MediumTitle(product.lend == true ? '상품 정보' : '이런 제품을 찾고있어요'),
            MediumText('${product.description}'),
            OriginDivider(lightGrey, 1, 30, 30),
            MediumTitle( product.lend == true ? '꼭 지켜주세요!' : '이런 제품을 우대해요'),
            MediumText('${product.caution}'),

            OriginDivider(lightGrey, 1, 30, 30),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                    AssetImage('assets/images/main_1.jpg'),
                  ),
                ),
                Container(
                  width: Get.width / 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "${product.user.nickname}",
                        style: TextStyle(
                            color:   Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,5,20,0),
                        child: Text(
                          "커뮤니티 인증 완료",
                          style: TextStyle(
                                color:  const Color(0xff999999),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle:  FontStyle.normal,
                                fontSize: 10.0
                                ),
                          ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 10, 0)),
                Column(
                  children: [
                    // 빌런지수
                    Text(
                        "빌런지수",
                        style: const TextStyle(
                            color:  const Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontFamily: "NotoSansCJKkr",
                            fontStyle:  FontStyle.normal,
                            fontSize: 18.0
                        ),
                        textAlign: TextAlign.left
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,5,0,0),
                      child: Text(
                          "82",
                          style: const TextStyle(
                              color:  const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                  ],
                ),
              ],
            ),
            OriginDivider(lightGrey, 1, 30, 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child:// 뚜디니는졸귀야 님의 다른 물품
              Text(
                  "${product.user.nickname} 님의 다른 물품",
                  style: const TextStyle(
                      color:  const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),






            //TODO 사용자 별 상품 정보 불러오기

            Padding(
              padding: const EdgeInsets.fromLTRB(24,10,24,0),
              child: Obx(()
              {
                if (LendProductController.isLoading.value)
                  return Center(child: CircularProgressIndicator());

                else
                  return
                    GridView.count(
                      physics: ScrollPhysics(),
                      childAspectRatio: (150/216),
                      crossAxisSpacing:12 ,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      // childAspectRatio: (Get.width*0.134/Get.height),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,

                      children: List.generate(
                          EtcProductController.productList.length,


                              (index) {

                            return


                              EtcProductTile(EtcProductController.productList[index], EtcProductController.productList[index].user.id);


                          }




                      ),
                    );
              }
              ),
            ),









          ],
        ),






      );






  }
}
