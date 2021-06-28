import 'package:bilrun/design/usedColors.dart';

import 'package:bilrun/screens/rent/rent_controller.dart';
import 'package:bilrun/screens/rent/rent_service.dart';
import 'package:bilrun/widgets/community/now_community.dart';
import 'package:bilrun/widgets/location/controller_location.dart';

import 'package:bilrun/widgets/search/search_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/screens/Rent/rent_product_list.dart';

void main() => runApp(RentMain());

class RentMain extends StatefulWidget {
  RentMain({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RentMainState createState() => _RentMainState();
}

class _RentMainState extends State<RentMain> {
  static String UserToken;
  RentProductController rentProductController =
      Get.put(RentProductController());

  Future<Null> refresh() async {
    RentProductListService.fetchRentProducts(UserToken);
    RentProductController.rentfetchProducts();
    rentProductController = Get.put(RentProductController());
  }

  @override
  void initState() {
    super.initState();
  }

  static String fullLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("빌림"),

          // FutureBuilder(
          //     future: LocationDataController.fetchLocationData(),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       }

          //       if (snapshot.hasError) {
          //         return Text("banner error ${snapshot.hasError}");
          //       } else {
          //         var location =
          //             LocationDataController.locationData.value.results[0];
          //         print(location);
          //         fullLocation = location.formattedAddress;
          //         fullLocation = fullLocation.substring(5);
          //       }
          //       return Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: Text(
          //               "$fullLocation",
          //               style: const TextStyle(
          //                   color: const Color(0xff191919),
          //                   fontWeight: FontWeight.w700,
          //                   fontFamily: "NotoSansCJKkr",
          //                   fontStyle: FontStyle.normal,
          //                   fontSize: 16.0),
          //             ),
          //           ),
          //           IconButton(
          //               icon: Icon(
          //                 Icons.keyboard_arrow_down_outlined,
          //                 color: Colors.black,
          //                 size: 25,
          //               ),
          //               onPressed: () {
          //                 Get.to(null);
          //               })
          //         ],
          //       );
          //     }),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: SearchButton(),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SafeArea(
          child: Column(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  OriginDivider(mainRed, 100, 0, 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: NowCommunity(),
                        ),
                        Text("지금 빌려주세요!",
                            style: const TextStyle(
                                color: const Color(0xff191919),
                                fontWeight: FontWeight.w700,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ),
                  Obx(() {
                    if (RentProductController.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:
                              RentProductController.rentProductList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(children: [
                              RentProductTile(
                                  RentProductController.rentProductList[index]),
                              Container(
                                height: 1,
                                color: Color(0xffdedede),
                                width: Get.width * 0.867,
                              ),
                            ]);
                          });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
