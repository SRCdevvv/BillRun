
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
  }



  static  Future  NoticeFetchList() async {
    try {
      isLoading(true);
      var noticeList = await NoticeService.fetchNotice();



      if (noticeList != null) {
        noticeLists.value = noticeList;



      }
      else if(NoticeList == null) {
        print('error');
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