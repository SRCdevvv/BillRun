import 'package:flutter/material.dart';
import 'package:bilrun/model/product_list_model.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/lend/lend_like.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';

class EtcProductTile extends StatelessWidget {
  final ProductList lendproduct;
  final int UserId;
  const EtcProductTile(this.lendproduct, this.UserId);

  @override
  Widget build(BuildContext context) {
    int differenceDay = int.parse(
        DateTime.now().difference(lendproduct.createdAt).inDays.toString());
    int differenceHours = int.parse(
        DateTime.now().difference(lendproduct.createdAt).inHours.toString());
    int differneceMinute = int.parse(
        DateTime.now().difference(lendproduct.createdAt).inMinutes.toString());

    switch (lendproduct.priceProp) {
      case "1h":
        lendproduct.priceProp = '시간 당';
        break;
      case "Week":
        lendproduct.priceProp = '주 당';
        break;
      case "Day":
        lendproduct.priceProp = '일 당';
        break;
    }

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () => {
              Get.to(
                DetailScreen(),
                arguments: lendproduct,
              )
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: Get.width * 0.417,
                    height: Get.width * 0.417,
                    child: lendproduct.photo1.isEmpty
                        ? Image.network(
                            'https://www.city.kr/files/attach/images/164/317/333/022/f10f68187fc57c148616fcca1536ea0f.jpg',
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            '${lendproduct.photo1}',
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Positioned(
                  right: 5,
                  child: ProductLike(
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            height: 22,
            padding: EdgeInsets.only(top: 3),
            child: Text("${lendproduct.name}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
          Row(
            children: [
              Container(
                height: 18,
                child: Text("${lendproduct.price}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                height: 22,
                child: Text("원",
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                height: 18,
                child: Text("/${lendproduct.priceProp}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: const Color(0xff999999),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                  child: Text("1.1km",
                      style: const TextStyle(
                          color: const Color(0xffaa0000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left)),
            ],
          ),
          Container(
            height: 16,
            child: Text(
                differenceDay < 1
                    ? differenceHours < 1
                        ? differneceMinute < 30
                            ? "방금 전"
                            : "$differneceMinute분 전 "
                        : "$differenceHours시간 전"
                    : " $differenceDay일 전",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: const Color(0xff999999),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 10.0),
                textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}
