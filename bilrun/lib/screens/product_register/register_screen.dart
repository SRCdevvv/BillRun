import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/main/main_screen.dart';
import 'package:bilrun/screens/product_register/register_components.dart';
import 'package:bilrun/screens/product_register/register_service/product_register_service.dart';
import 'package:bilrun/widgets/location/set_location.dart';
import 'package:bilrun/widgets/pick_up_photos.dart';
import 'package:bilrun/widgets/pickup_photo_only.dart';
import 'package:bilrun/widgets/white_appbar.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/design/divider_example.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(ProductRegister());

bool ProductCategory;
String PriceProp;
String productAddress;
String selectedCategory;
String title = "주소를 등록해주세요.";
double setLat;
double setLng;
int status;

var value;

class _initData {
  int userID;
  String productName;
  String description;
  String caution;
  int price;
  String priceProp;
  String productAddress;
  bool productCategory;
  String productMenu;
  double productLat;
  double productLng;
  String productImg1;
  String productImg2;
  String productImg3;
  String productImg4;
  String productImg5;
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
  String userToken;
  int userId;
  static String imagePath = "";

  @override
  void initState() {
    super.initState();
    ProductCategory = Get.arguments[0];
    userToken = MainScreenState.mainUserToken;
    data.userID = MainScreenState.mainUserId;
    print("user id::: ${MainScreenState.mainUserId}");
    isSelected = [true, false, false];
  }

  _initData data = new _initData();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("register screen : $userToken");
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
                  //child: ImagePickUP(),
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
                      if (selectedCategory == '전공도서') {
                        data.productMenu = 'majorBook';
                      } else if (selectedCategory == '생활잡화') {
                        data.productMenu = 'household';
                      } else if (selectedCategory == '디지털/가전') {
                        data.productMenu = 'digital';
                      } else if (selectedCategory == '게임/취미') {
                        data.productMenu = 'game';
                      } else if (selectedCategory == '여성잡화') {
                        data.productMenu = 'woman';
                      } else if (selectedCategory == '남성잡화') {
                        data.productMenu = 'man';
                      } else if (selectedCategory == '스포츠') {
                        data.productMenu = 'sports';
                      } else if (selectedCategory == '기타') {
                        data.productMenu = 'etc';
                      }
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
                  List locationData = await Get.to((() => SetLocation()));

                  setState(() {
                    data.productAddress = locationData[0];
                    title = data.productAddress;
                    setLat = locationData[1];
                    setLng = locationData[2];
                    data.productLat = setLat;
                    data.productLng = setLng;
                  });
                  print("productAddress : ${data.productAddress}");
                  print(
                      "productLatLng1 : ${locationData[1]}&& ${locationData[2]}");
                  print("productLatLng 2: $setLat && $setLng");
                  print(
                      "productLatLng3 : ${data.productLat} && ${data.productLng}");
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
        print("userId : ${data.userID}");
        print("userId2 : ${MainScreenState.mainUserId}");
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          data.productImg1 = pickupState.imageUrl[0];
          data.productImg2 = pickupState.imageUrl[1];
          data.productImg3 = pickupState.imageUrl[2];
          data.productImg4 = pickupState.imageUrl[3];
          data.productImg5 = pickupState.imageUrl[4];
          print("${data.productImg3}");
          await postProduct
              .getOrCreateInitAPIData(
            data.userID,
            ProductCategory,
            data.price,
            data.productName,
            data.description,
            data.caution,
            data.productMenu,
            PriceProp,
            data.productImg1,
            data.productImg2,
            data.productImg3,
            data.productImg4,
            data.productImg5,
            data.productAddress,
            data.productLat,
            data.productLng,
            userToken,
          )
              .then((value) {
            status = value;
            print("value :: $value");
            print("statusCode :: $status");
            if (status == 201) {
              data.productAddress = '';
              Get.snackbar(
                "물품 등록 성공",
                "",
                duration: Duration(seconds: 5),
                backgroundColor: Colors.white,
              );
              Get.to(() => MainScreen(), arguments: [userToken, data.userID]);
            } else {
              Get.snackbar(
                "물품 등록 실패",
                "모든 항목을 작성했는지 확인해주세요.",
                duration: Duration(seconds: 5),
                backgroundColor: Colors.white,
              );
            }
          });
        }
      }),
    );
  }
}
