import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kopo/kopo.dart';

Widget streetAddressSearch(String userAddress, IconButton iconButton) {
  return Stack(
    children: <Widget>[
      Container(
        child: Center(
          child: Text(
            userAddress == null ? "주소를 검색해주세요" : "$userAddress",
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
            border: Border.all(color: const Color(0xff999999), width: 1),
            color: const Color(0xffffffff)),
      ),
      Positioned(
        right: 5,
        top: 2,
        bottom: 5,
        child: iconButton,
      ),
    ],
  );
}

Widget nowLocationLoadButton(onTap) {
  return InkWell(
    child: Container(
      width: 312,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: const Color(0xff191919), width: 1),
          color: const Color(0xffffffff)),
      child: Padding(
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
    onTap: onTap,
  );
}

Widget loadGoogleMap(LatLng latLng) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
          width: Get.width * 0.867,
          height: Get.height * 0.27,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 16,
            ),
            //markers: marker,
          )),
    ),
  );
}
