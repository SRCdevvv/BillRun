import 'dart:core';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/model/product_detail_model.dart';
import 'package:bilrun/screens/product_register/product_register_service.dart';
import 'package:bilrun/screens/product_register/upload_file.dart';
import 'package:bilrun/widgets/camera_imagepicker_widget.dart';
import 'package:bilrun/widgets/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

void main() => runApp(ProductRegister());

bool ProductCategory;
String PriceProp;


class _initData {
  String productName;
  String description;
  String caution;
  int price;
  String priceProp;
  List images ;

}

class ProductRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductRegisterWidget();
  }
}

class ProductRegisterWidget extends StatefulWidget {
  @override
  _ProductRegisterWidgetState createState() => _ProductRegisterWidgetState();
}

class _ProductRegisterWidgetState extends State<ProductRegisterWidget> {
 static List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductCategory = Get.arguments;
    isSelected = [true,false,false];
  }

  _initData _data = new _initData();
  final _formKey = GlobalKey<FormState>();

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
            ProductCategory == true ? "빌려드림 상품 등록 " : "빌림 상품 등록",
            style: TextStyle(color: Colors.black, fontSize: 28.0),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //TODO 멀티 이미지 픽커로 바꾸기
                Padding(
                  padding: const EdgeInsets.fromLTRB(45,30,0,0),
                  child: MyApps(),
                ),




                Padding(
                  padding: const EdgeInsets.fromLTRB(60,10,60,10),
                  child: TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return '상품명은 필수 입력 항목입니다!';
                      } else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: '상품명',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lightGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:mainRed)
                      ),
                    ),
                    cursorColor:mainGreyy,



                    onSaved:(String value) {
                      this._data.productName = value;
                    },

                  ),
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
                        onPressed: () {}),
                  ),
                ]),
                OriginDivider(lightGrey, 1, 65, 60),

                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 10),
                  child: Row(
                    children: [
                          Container(
                            child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value.isEmpty){
                                return '가격은 필수 입력 항목입니다!';
                              } else{
                                return null;
                              }
                            },
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                            decoration: InputDecoration(
                              hintText: '가격',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: lightGrey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:mainRed)
                              ),
                            ),

                           cursorColor:mainGreyy,


                            onSaved: ( value){
                            this._data.price = int.parse(value);
                            },
                        ),
                            width: 300,
                            height: 50,
                          ),





                      Container(
                          child: Text(
                        "원",
                        style: TextStyle(fontSize: 20.0),
                      )),
                    ],
                  ),
                ),




            ToggleButtons(
              borderColor: Colors.transparent,
              borderWidth: 5,
              selectedBorderColor: Colors.transparent,
              selectedColor: Color(0xffaa0000),
              splashColor: Colors.transparent,
              color: Colors.transparent,
              focusColor: Colors.transparent,
              fillColor: Colors.transparent,

              children: <Widget>[
                // first toggle button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                          border: Border.all(
                              color: isSelected[0] == true ? Color(0xffaa0000): Color(0xff999999),
                              width: 2
                          ),

                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              "시간 당",
                              style:  TextStyle(
                                color:  isSelected[0] == true ? Color(0xffaa0000): Color(0xff999999),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.0

                              ),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )


                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                          border: Border.all(
                              color: isSelected[1] == true ? Color(0xffaa0000): Color(0xff999999),
                              width: 2
                          ),
                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              "일 당",
                              style:  TextStyle(
                                color:  isSelected[1] == true ? Color(0xffaa0000): Color(0xff999999),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.0,

                              ),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )


                  )
                ),
                // third toggle button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)
                          ),
                          border: Border.all(
                              color: isSelected[2] == true ? Color(0xffaa0000): Color(0xff999999),
                              width: 2
                          ),

                        ),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              "주 당 ",
                              style:  TextStyle(
                                color:  isSelected[2] == true ? Color(0xffaa0000): Color(0xff999999),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.0,

                              ),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )


                  )
                ),
              ],

              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                    if(isSelected[i]==true){
                        switch(i){
                        case 0 :
                        PriceProp = "1h";
                        break;
                        case 1:
                        PriceProp = "Day";
                        break;
                        case 2:
                        PriceProp = "Week";
                        break;
                        }
                        print(PriceProp);

    }
                    }
                  }
                );
              },


              isSelected: isSelected,
            ),


                OriginDivider(lightGrey, 1, 24, 24),

            Padding(
              padding: const EdgeInsets.fromLTRB(44, 0, 24, 0),
              child: TextFormField(
                    maxLines: 8,
                validator: (value){
                  if(value.isEmpty){
                    return '상품 설명은 필수 입력 항목입니다!';
                  } else{
                    return null;
                  }
                },
                    decoration: InputDecoration(
                      hintText: ProductCategory == true
                            ? "상품 정보와 상태를 자세하게 작성해주세요. "
                         : "빌릴 상품에 원하는 기능 및 옵션을 작성해주세요.",

                      hintStyle:TextStyle(
                          color:  const Color(0xff999999),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0) ,

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:mainRed)
                      ),
                    ),
                cursorColor:mainGreyy,
                    onSaved:(String value) {
                      this._data.description = value;
                    },
                  ),
            ),


                OriginDivider(lightGrey, 1, 24, 24),


                Padding(
                  padding: const EdgeInsets.fromLTRB(44,0,0,0),
                  child: TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return '거래 요구사항은 필수 입력 항목입니다!';
                      } else{
                        return null;
                      }
                    },
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "거래 관련 요구사항을 자세하게 적어주세요.",
                      hintStyle:TextStyle(
                          color:  const Color(0xff999999),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0) ,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),

                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:mainRed)
                      ),
                    ),
                    cursorColor:mainGreyy,
                      onSaved:(String value) {
                      this._data.caution = value;
                      },
                  ),
                ),

                OriginDivider(lightGrey, 1, 24, 24),

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
                      padding: const EdgeInsets.fromLTRB(120, 10, 10, 30),
                      child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 45,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),


                InkWell(
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
                    onTap: () async{
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                         await getOrCreateInitAPIData(_data.price, _data.productName, _data.description, _data.caution, ProductCategory,PriceProp);
                         //await asyncFileUpload('업로드예시', images[0]);

                      }


                    }),
              ],
            ),
          ),
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

Widget TimeStandard(String timeStandard, List<bool> Selected) {

  return
    // 사각형 23904
    Padding(
      padding: const EdgeInsets.fromLTRB(5,0,5,0),
      child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(15)
              ),
              border: Border.all(
                  color: const Color(0xff999999),
                  width: 2
              ),
             // color: isSelected[i] ==true ? Colors.red[900] : Color(0xffffffff)
          ),
        child:
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
              "$timeStandard",
              style:  TextStyle(
                  color:  Selected == true ? Colors.red[900]: Color(0xff999999),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle:  FontStyle.normal,
                  fontSize: 14.0,

              ),
              textAlign: TextAlign.center
          ),
        ),
        )


    );
  }

Container ExplainText(String explainText) {
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
