import 'package:flutter/material.dart';
import 'package:bilrun/model/product_list_model.dart';

class LendProductTile extends StatelessWidget {
  final ProductList lendproduct;
  const LendProductTile(this.lendproduct);

  @override
  Widget build(BuildContext context) {
    switch (lendproduct.priceProp) {
      case "1h":
        lendproduct.priceProp = '시간';
        break;
      case "30m":
        lendproduct.priceProp = '30분';
        break;
      case "Day":
        lendproduct.priceProp = '일';
        break;
    }

    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(bottom:8),
                  width:double.infinity,
                  height: 150,
                  child: Image.network(
                    '${lendproduct.photo}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 150,
            height: 22,

            child: Text("${lendproduct.name}",
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
                width: 39,
                height: 18,
                child: Text("${lendproduct.price}",
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                width: 13,
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
                width: 30,
                height: 18,
                child: Text("/${lendproduct.priceProp}",
                    style: const TextStyle(
                        color: const Color(0xff999999),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('${lendproduct.userId.profile}'),
                radius: 16.0,
              ),
              Container(
                width: 44,
                height: 22,
                child: Text('${lendproduct.userId.nickname}',
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(color: const Color(0xff999999))),
              Container(
                width: 41,
                height: 16,
                child: Text("30분 전",
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
        ],
      ),
    );
  }
}
