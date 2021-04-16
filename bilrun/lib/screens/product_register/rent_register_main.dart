import 'package:flutter/material.dart';
import 'package:bilrun/design/divider_example.dart';
import 'camera_image_picker.dart';
import 'package:get/get.dart';


void main() => runApp(RentProductRegister());


bool ProductCategory;


class RentProductRegister extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            iconSize: 40.0,
            onPressed: () => {Get.back()},
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            "빌림 상품 등록",
            style: TextStyle(color: Colors.black, fontSize: 28.0),
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          ProductRegisterWidget(),

        ],
      ),
    );
  }
}


class ProductRegisterWidget extends StatefulWidget {
  @override
  _ProductRegisterWidgetState createState() => _ProductRegisterWidgetState();
}

class _ProductRegisterWidgetState extends State<ProductRegisterWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductCategory = Get.arguments;
  }


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: <Widget>[
          //TODO 이미지 픽커
          CameraImagePicker(),


          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
            child: ProductTextfield('상품명'),
          ),

          //TODO 카테고리 만들기
          Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 0, 0, 10),
              child: Text("카테고리 선택", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 0, 10, 10),
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 45,
                  ),
                  onPressed: () {
                  }),
            ),
          ]),
          OriginDivider(Colors.grey[500], 1, 65, 60),

          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 10, 10),
            child: Row(
              children: [
                ProductTextfield('가격'),
                Container(
                    child: Text(
                      "원",
                      style: TextStyle(fontSize: 20.0),
                    )),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 10),
            child: Row(
              children: <Widget>[
                TimeStandard('30분 당'),
                TimeStandard("시간 당"),
                TimeStandard("일 당"),
                TimeStandard("주 당"),
              ],
            ),
          ),

          ExplainText('상품 정보와 상태를 자세하게 작성해주세요.'),

          ExplainText('거래 관련 요구 사항을 자세하게 작성해주세요.'),

          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      size: 45,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 40, 20),
                child: Container(
                    child: Text("위치정보", style: TextStyle(fontSize: 30))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 10, 20, 30),
                child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      size: 45,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),

          //TODO gesture detector에 기능 추가하기
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.red[900],
              child: Center(
                  child: Text(
                    "등록하기",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Container ProductTextfield(String title) {
  return Container(
    //padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
    margin: EdgeInsets.all(12),
    width: 300,
    height: 50,
    child: TextField(
      decoration: InputDecoration(
        labelText: '$title',
      ),
    ),
  );
}

TextButton TimeStandard(String timeStandard) {
  return TextButton(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red[900]),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text(
          "$timeStandard",
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.red[900],
          ),
        ),
      ));
}

Container ExplainText(String explainText) {
  print(ProductCategory);
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: TextField(
      maxLines: 8,
      decoration: InputDecoration(
        hintText: "$explainText",
        border: OutlineInputBorder(),
      ),
    ),
  );
}

