import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/design/product_detail_design_widget.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/model/product_detail_model.dart';



class DetailScreenInfo extends StatelessWidget {

  final DetailProduct product;
  const DetailScreenInfo(this.product);

  @override
  Widget build(BuildContext context) {
    //print(product.name);
    return
      Container(
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
                      fontSize: 40, fontWeight: FontWeight.normal),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                SmallIcon(Icons.access_time),
                SmallTitle('7시간 전', Colors.grey[700], 20),
                SmallIcon(Icons.remove_red_eye_outlined),
                SmallTitle('29', Colors.grey[700], 20),
                SmallIcon(Icons.favorite_border_rounded),
                SmallTitle('${product.likeCount}', Colors.grey[700], 20),
              ],
            ),

            OriginDivider(Colors.grey[300], 1, 30, 30),
            MediumTitle(product.category == true ? '상품 정보' : '이런 제품을 찾고있어요'),
            MediumText('${product.description}'),
            OriginDivider(Colors.grey[300], 1, 30, 30),
            MediumTitle( product.category == true ? '꼭 지켜주세요!' : '이런 제품을 우대해요'),
            MediumText('${product.caution}'),

            OriginDivider(Colors.grey[300], 1, 30, 30),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                    AssetImage('assets/images/main_1.jpg'),
                  ),
                ),
                Container(
                  width: Get.width / 3,
                  child: Column(
                    children: <Widget>[
                      SmallTitle('${product.user.nickname}', Colors.grey[900], 20),

                      SmallTitle('사용자 위치', Colors.grey[900], 15),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 10, 0)),
                Column(
                  children: [
                    BoldTitle('빌런지수', Colors.black, 27),
                    SmallTitle('82', Colors.black, 20),
                  ],
                ),
              ],
            ),
            OriginDivider(Colors.grey[300], 1, 30, 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: BoldTitle('${product.user.nickname}님의 다른 물품', Colors.black, 20),
            ),
            //TODO 상품 정보 불러오기
          ],
        ),






      );






  }
}
