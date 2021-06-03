import 'package:bilrun/design/usedColors.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/screens/lend/lend_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchbarScreen extends StatefulWidget {
  @override
  _SearchbarScreenState createState() => _SearchbarScreenState();
}

class _SearchbarScreenState extends State<SearchbarScreen> {
  // final TextEditingController _textController = new TextEditingController();
  bool typing = false;
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
              iconSize: 30.0,
              onPressed: () => {Get.back()},
            ),
          ),
          title: Container(
            width: Get.width * 0.778,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: const Color(0xff999999), width: 1),
                color: const Color(0xffffffff)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: '검색어를 입력해주세요.', border: InputBorder.none),
              ),
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
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        categoryMenu("전공도서"),
                        categoryMenu("생활잡화"),
                        categoryMenu("디지털/가전"),
                        categoryMenu("게임/취미"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        categoryMenu("여성잡화"),
                        categoryMenu("남성잡화"),
                        categoryMenu("스포츠"),
                        categoryMenu("기타"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 20),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                              color: mainRed,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          text: "UserName"),
                      TextSpan(
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKkr",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          text: "님, 이 물품은 어떠세요?")
                    ])),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Obx(() {
                      if (LendProductController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return GridView.count(
                          physics: ScrollPhysics(),
                          childAspectRatio: (150 / 216),
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          // childAspectRatio: (Get.width*0.134/Get.height),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,

                          children: List.generate(
                              LendProductController.productList.length,
                              (index) {
                            return LendProductTile(
                                LendProductController.productList[index]);
                          }),
                        );
                    }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget categoryMenu(String categoryName) {
  return Container(
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Color(0xffeeeeee),
            ),
            CircleAvatar(
              radius: 25.0,
              //TODO 카테고리 별 이미지 새로 넣어주기
              backgroundImage: AssetImage('assets/images/chatlogo.png'),
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('$categoryName',
              style: const TextStyle(
                  color: const Color(0xff191919),
                  fontWeight: FontWeight.w400,
                  fontFamily: "NotoSansCJKkr",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ],
    ),
  );
}
