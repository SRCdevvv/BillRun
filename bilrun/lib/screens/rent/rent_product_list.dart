import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/model/product_list_model.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';

class RentProductTile extends StatelessWidget {
  final ProductList product;
  final String userToken;
  const RentProductTile(this.product, this.userToken);

  @override
  Widget build(BuildContext context) {
    print("rent token :: $userToken");
    int differenceDay = int.parse(
        DateTime.now().difference(product.createdAt).inDays.toString());
    int differenceHours = int.parse(
        DateTime.now().difference(product.createdAt).inHours.toString());

    switch (product.priceProp) {
      case "1h":
        product.priceProp = '시간 당';
        break;
      case "Week":
        product.priceProp = '주 당';
        break;
      case "Day":
        product.priceProp = '일 당';
        break;
    }

    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        child: Column(
          children: [
            Container(
                width: Get.width * 0.867,
                height: Get.height * 0.081,
                child: ListTile(
                  onTap: () => {
                    Get.to(() => DetailScreen(),
                        arguments: [product.id, userToken])
                  },
                  title: Container(
                    width: 246,
                    height: 22,
                    child: Text(
                      '${product.name}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Container(
                          height: 22,
                          child: Text('${product.price}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: const Color(0xff191919),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left)),
                      Container(
                        height: 22,
                        child: Text('원',
                            style: TextStyle(
                                color: const Color(0xff191919),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        height: 18,
                        child: Text('/${product.priceProp}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: const Color(0xff999999),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        height: 16,
                        child: Container(
                          height: 16,
                          child: Text(
                              differenceDay < 1
                                  ? "$differenceHours시간 전 "
                                  : " ᛫$differenceDay일 전",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: const Color(0xff999999),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSansCJKkr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ],
                  ),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: Get.width * 0.16,
                      height: Get.width * 0.16,
                      child: product.photo1.isEmpty
                          ? Image.network(
                              'https://www.city.kr/files/attach/images/164/317/333/022/f10f68187fc57c148616fcca1536ea0f.jpg',
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              '${product.photo1}',
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
