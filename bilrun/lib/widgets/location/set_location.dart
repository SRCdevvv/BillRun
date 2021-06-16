import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/location/now_location.dart';
import 'package:bilrun/widgets/location/service_geocoing.dart';
import 'package:bilrun/widgets/location/location_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'service_location.dart';
import 'package:kopo/kopo.dart';

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation>
    with AutomaticKeepAliveClientMixin<SetLocation> {
  String userAddress = '기본 주소 값';
  static double lat = 37.740354;
  static double lng = 127.199361;
  double nowLat;
  double nowLng;
  List<String> addressList = [];
  var localData;
  static String jibunAddress;
  static String productAddress;
  static double existingLat = lat;
  static double existingLng = lng;

  Future<void> convertData() async {
    await GeocodingService.convertLocationToLatlng('$jibunAddress');
    setState(() {
      lat = GeocodingService.geoLat;
      lng = GeocodingService.geoLng;
      print("$lat $lng");
    });
  }

  @override
  bool get wantKeepAlive => true;

  Future loadAddressData() async {
    localData = await Hive.box('addressDatas').get('address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
            "내 위치 설정하기",
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: streetAddressSearch(
                      userAddress,
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: mainGrey,
                        ),
                        iconSize: 20,
                        onPressed: () async {
                          KopoModel model = await Get.to(() => Kopo());

                          print(model.toJson());
                          setState(() {
                            userAddress = ' ${model.jibunAddress}';
                            print(userAddress);

                            jibunAddress =
                                ('${model.jibunAddress.replaceAll(new RegExp(r"\s+"), "")}');
                            print('지번주소 : $jibunAddress');
                            convertData();
                            productAddress =
                                ('${model.sido} ${model.sigungu} ${model.bname1} ${model.bname2}');
                            print(productAddress);
                          });
                        },
                      ),
                    ),
                  ),
                ),

                // 현 위치로 주소 설정하기
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: FutureBuilder(
                      future: NowLocationService.loadNowLocation(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          //print("future wating");
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          // print("future error");
                          return Text("error");
                        } else {
                          nowLat = NowLocationService.returnLatLng.latitude;
                          nowLng = NowLocationService.returnLatLng.longitude;
                        }
                        return nowLocationLoadButton(() async {
                          await LocationService.convertLatLngToLocation(
                              LatLng(nowLat, nowLng));

                          setState(() {
                            lat = nowLat;
                            lng = nowLng;
                            userAddress = LocationService.address;
                            productAddress = LocationService.productAddress;
                          });
                        });
                      },
                    ),
                  ),
                ),

                //구글맵

                // Center(
                //     child: lat != existingLat || lng != existingLng
                //         ? loadGoogleMap(LatLng(lat, lng), createMarker())
                //         : loadGoogleMap(
                //             LatLng(existingLat, existingLng), createMarker())),

                // 최근 주소
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 0, 10),
                  child: Text("최근 주소",
                      style: const TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "NotoSansCJKkr",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),

                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: addressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Hive.box('addressDatas').put('address', addressList);

                      return Column(children: [
                        Container(
                            height: 40,
                            width: Get.width * 0.867,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${addressList[index]}",
                                    style: TextStyle(
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "NotoSansCJKkr",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            addressList.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: Color(0xffdedede),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                        OriginDivider(lightGrey, 1, 30, 30)
                      ]);
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 240,
        height: 60,
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.back(result: productAddress);
          },
          label: Text("주소 등록",
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              textAlign: TextAlign.left),
          backgroundColor: mainRed,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Set<Marker> createMarker() {
    return <Marker>[
      Marker(
          draggable: true,
          markerId: MarkerId("marker_1"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: "$userAddress"),
          onDragEnd: ((newPosition) {
            print(newPosition.latitude);
            print(newPosition.longitude);
            setState(() async {
              lat = newPosition.latitude;
              lng = newPosition.longitude;
              print("$lat $lng");
              print("반영전 : $userAddress");
              await LocationService.convertLatLngToLocation(LatLng(lat, lng));
              try {
                setState(() {
                  userAddress = LocationService.address;
                });

                print("반영후 : $userAddress");
                addressList.add(userAddress);
              } catch (e) {
                print("$e + 위치 탐색 실패");
              }
            });
          }))
    ].toSet();
  }
}

@HiveType(typeId: 1)
class Address {
  Address({this.address});
  @HiveField(0)
  String address;
  @override
  String toString() {
    return '$address';
  }
}
