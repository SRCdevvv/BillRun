
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'notice_service.dart';
import 'package:bilrun/model/notice_model.dart';





class NoticeController extends GetxController {

  static  var isLoading = true.obs;
  // ignore: deprecated_member_use
  static  var noticeLists = List<NoticeList>().obs;
  static String nowStatus ;



  @override
  void onInit() {
    NoticeFetchList();
    super.onInit();
    print("공지 onit 실행됨");
  }


  // ignore: non_constant_identifier_names
  static  Future  NoticeFetchList() async {
    try {
      isLoading(true);
      var notice = await NoticeService.fetchNotice();
     // print('notice controller : $notice');



      if (notice != null) {
        noticeLists.value = notice;
        print("공지 컨트롤러 실행됨");



      }
      else if(notice== null) {
        print('Notice Error');
        return Scaffold(
          body: Column(
            children: [
              Text('데이터 로드 실패')
            ],
          ),
        );
      }



    } finally {
      isLoading(false);
    }
  }




}