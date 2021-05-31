import 'package:bilrun/design/divider_example.dart';
import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/location/controller_location.dart';
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
  String addressJSON = '';
  double lat;
  double long;
  List<String> addressList = [];
  var localData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    LocationDataController.locationData();
  }

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 0, 15),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Text(
                            addressJSON == null ? "주소를 검색해주세요" : "$addressJSON",
                            style: const TextStyle(
                                color: const Color(0xff191919),
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        ),
                        width: 312,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                                color: const Color(0xff999999), width: 1),
                            color: const Color(0xffffffff)),
                      ),
                      Positioned(
                        right: 5,
                        top: 2,
                        bottom: 5,
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: mainGrey,
                          ),
                          iconSize: 20,
                          onPressed: () async {
                            KopoModel model = await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Kopo(),
                              ),
                            );
                            //print(model.toJson());
                            setState(() {
                              addressJSON =
                                  '${model.address} ${model.buildingName}';
                              addressList.add(addressJSON);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        LocationService.fetchLocation();
                        addressJSON = LocationService.address.substring(5);
                        addressList.add(addressJSON);
                        // localData = Hive.box('addressDatas').get('address');
                      });
                    },
                    child: Container(
                      width: 312,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: const Color(0xff191919), width: 1),
                          color: const Color(0xffffffff)),
                      child: // 현 위치로 주소 설정하기
                          Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child: Icon(
                                  (Icons.location_on),
                                  size: 20,
                                ),
                              ),
                              Text("현 위치로 주소 설정하기",
                                  style: const TextStyle(
                                      color: const Color(0xff191919),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: LocationService.fetchLocation(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: Get.width * 0.867,
                          height: Get.height * 0.27,
                          child: Center(child: CircularProgressIndicator()));
                    }

                    if (snapshot.hasError) {
                      return Text("location error");
                    } else {
                      lat = LocationService.lat;
                      long = LocationService.long;

                      LatLng(LocationService.lat, LocationService.long);
                      Set<Marker> _createMarker() {
                        return <Marker>[
                          Marker(
                              draggable: true,
                              markerId: MarkerId("marker_1"),
                              position: LatLng(lat, long),
                              infoWindow: InfoWindow(title: "$addressJSON"),
                              onDragEnd: ((newPosition) {
                                print(newPosition.latitude);
                                print(newPosition.longitude);
                                setState(() {
                                  lat = newPosition.latitude;
                                  long = newPosition.longitude;
                                  LocationService.fetchLocation();
                                  addressJSON =
                                      LocationService.address.substring(5);
                                  addressList.add(addressJSON);
                                });
                              }))
                        ].toSet();
                      }

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Container(
                              width: Get.width * 0.867,
                              height: Get.height * 0.27,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(lat, long),
                                  zoom: 16,
                                ),
                                markers: _createMarker(),
                              )),
                        ),
                      );
                    }
                  },
                ),
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
          onPressed: () {},
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
