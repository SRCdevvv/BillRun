import 'dart:core';
import 'dart:io';

import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/product_register/register_components.dart';
import 'package:bilrun/screens/product_register/register_service/product_register_service.dart';
import 'package:bilrun/widgets/location/set_location.dart';

import 'package:bilrun/widgets/pick_up_photos.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/design/divider_example.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(ProductRegister());

bool ProductCategory;
String PriceProp;
String productAddress;
String selectedCategory;
String title = "주소를 등록해주세요.";

var value;

class _initData {
  String productName;
  String description;
  String caution;
  int price;
  String priceProp;
  String productAddress;
  String productCategory;
  LatLng productLatLng;
  List<File> imageFiles = [];
}

class ProductRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductRegisterWidget();
  }
}

class ProductRegisterWidget extends StatefulWidget {
  @override
  ProductRegisterWidgetState createState() => ProductRegisterWidgetState();
}

class ProductRegisterWidgetState extends State<ProductRegisterWidget> {
  static List<bool> isSelected;
  Future myFuture;

  @override
  void initState() {
    super.initState();
    ProductCategory = Get.arguments;
    isSelected = [true, false, false];
  }

  _initData data = new _initData();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(ProductCategory == true ? "빌려드림 상품 등록 " : "빌림 상품 등록"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: pickup(),
                ),
                RegisterName((String value) {
                  this.data.productName = value;
                }),
                OriginDivider(lightGrey, 1, 0, 0),
                RegisterCategory(
                  selectedCategory,
                  (String newValue) {
                    setState(() {
                      selectedCategory = newValue;
                      data.productCategory = newValue;
                    });
                  },
                ),
                OriginDivider(lightGrey, 1, 0, 0),
                RegisterPrice((value) {
                  this.data.price = int.parse(value);
                }),
                OriginDivider(lightGrey, 1, 0, 0),
                Center(
                  child: ThreeTogleButtons(
                    isSelected,
                    (int index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                          if (isSelected[i] == true) {
                            switch (i) {
                              case 0:
                                PriceProp = "1h";
                                break;
                              case 1:
                                PriceProp = "Day";
                                break;
                              case 2:
                                PriceProp = "Week";
                                break;
                            }
                          }
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OriginDivider(lightGrey, 1, 0, 0),
                RegisterDescription(
                  ProductCategory == true
                      ? "상품 정보와 상태를 자세하게 작성해주세요. "
                      : "빌릴 상품에 원하는 기능 및 옵션을 작성해주세요.",
                  (String value) {
                    this.data.description = value;
                  },
                ),
                OriginDivider(lightGrey, 1, 0, 0),
                RegisterCaution(
                  (String value) {
                    this.data.caution = value;
                  },
                ),
                OriginDivider(lightGrey, 1, 0, 0),
                SizedBox(
                  height: 10,
                ),
                RegisterLocation(title, () async {
                  data.productAddress = await Get.to((() => SetLocation()));
                  print("productAddress : ${data.productAddress}");
                  setState(() {
                    title = data.productAddress;
                  });
                }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: RegisterButton(() async {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          await getOrCreateInitAPIData(
            data.price,
            data.productName,
            data.description,
            data.caution,
            ProductCategory,
            PriceProp,
          );
        }
      }),
    );
  }
}
