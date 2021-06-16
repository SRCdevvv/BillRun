import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/widgets/location/set_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget RegisterName(onSaved) {
  return Container(
    width: Get.width * 0.867,
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return '상품명은 필수 입력 항목입니다!';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: '상품명',
        labelStyle: TextStyle(color: mainGrey),
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
      ),
      cursorColor: mainGrey,
      onSaved: onSaved,
    ),
  );
}

Widget RegisterCategory(selectedCategory, onChanged) {
  return DropdownButton<String>(
    value: selectedCategory,
    hint: Text("카테고리 선택"),
    icon: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(Icons.keyboard_arrow_down),
      ],
    ),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(
        color: const Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontFamily: "NotoSansCJKkr",
        fontStyle: FontStyle.normal,
        fontSize: 18.0),
    underline: Container(
      height: 2,
      color: Colors.transparent,
    ),
    onChanged: onChanged,
    items: <String>[
      '전공도서',
      '생활잡화',
      '디지털/가전',
      '게임/취미',
      '여성잡화',
      '남성잡화',
      '스포츠',
      '기타'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

Widget RegisterPrice(onSaved) {
  return Row(
    children: [
      Container(
        child: TextFormField(
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return '가격은 필수 입력 항목입니다!';
            } else {
              return null;
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          decoration: InputDecoration(
            hintText: '가격',
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          cursorColor: mainGrey,
          onSaved: onSaved,
        ),
        width: 300,
        height: 50,
      ),
      Container(
        child: // 원
            Text("원",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
      ),
    ],
  );
}

Widget EachToggleButton(String title, Color color) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: color, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("$title",
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.center),
        ),
      ));
}

Widget ThreeTogleButtons(isSelected, onPressed) {
  return ToggleButtons(
    borderColor: Colors.transparent,
    borderWidth: 5,
    selectedBorderColor: Colors.transparent,
    selectedColor: mainRed,
    splashColor: Colors.transparent,
    color: Colors.transparent,
    focusColor: Colors.transparent,
    fillColor: Colors.transparent,
    children: <Widget>[
      EachToggleButton('시간 당', isSelected[0] == true ? mainRed : mainGrey),
      EachToggleButton('일 당', isSelected[1] == true ? mainRed : mainGrey),
      EachToggleButton('주 당', isSelected[2] == true ? mainRed : mainGrey),
    ],
    onPressed: onPressed,
    isSelected: isSelected,
  );
}

Widget RegisterDescription(String title, onSaved) {
  return TextFormField(
    maxLines: 10,
    validator: (value) {
      if (value.isEmpty) {
        return '상품 설명은 필수 입력 항목입니다!';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      hintText: title,
      hintStyle: TextStyle(
          color: const Color(0xff999999),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 16.0),
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
    ),
    cursorColor: mainGrey,
    onSaved: onSaved,
  );
}

Widget RegisterCaution(onSaved) {
  return TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return '거래 요구사항은 필수 입력 항목입니다!';
      } else {
        return null;
      }
    },
    maxLines: 10,
    decoration: InputDecoration(
      hintText: "거래 관련 요구사항을 자세하게 적어주세요.",
      hintStyle: TextStyle(
          color: const Color(0xff999999),
          fontWeight: FontWeight.w400,
          fontFamily: "NotoSansCJKkr",
          fontStyle: FontStyle.normal,
          fontSize: 16.0),
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
    ),
    cursorColor: mainGrey,
    onSaved: onSaved,
  );
}

Widget RegisterLocation(String title, onPressed) {
  return Row(
    children: <Widget>[
      IconButton(
          icon: Icon(
            Icons.location_on,
            size: 25,
          ),
          onPressed: () {}),
      Container(
        child: // 서울특별시 광진구 자양1동
            Text("$title",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
      ),
      Spacer(),
      IconButton(
        icon: Icon(
          Icons.keyboard_arrow_right,
          size: 25,
        ),
        onPressed: onPressed,
      ),
    ],
  );
}

Widget RegisterButton(onTap) {
  return InkWell(
    child: Container(
      width: Get.width,
      height: 60,
      color: mainRed,
      child: Center(
          child: // 등록하기
              Text("등록하기",
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansCJKkr",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.left)),
    ),
    onTap: onTap,
  );
}
