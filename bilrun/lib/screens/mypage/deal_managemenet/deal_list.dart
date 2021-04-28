 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'deal_list_tile.dart';



 class DealManagement extends StatefulWidget {
   @override
   _DealManagementState createState() => _DealManagementState();
 }

 class _DealManagementState extends State<DealManagement>
     with SingleTickerProviderStateMixin {
   TabController _tabController;
   bool isTabed=false;

   @override
   void initState() {
     _tabController = TabController(length: 2, vsync: this);
     super.initState();
   }

   @override
   void dispose() {
     super.dispose();
     _tabController.dispose();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
       backgroundColor: Colors.white,
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
              "거래 관리",
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
          ),
          centerTitle: false,

        ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [

             Container(
               height: 50,
               decoration: BoxDecoration(
                 color: Color(0xffdedede),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                 topRight: Radius.circular(25)),
               ),
               child: TabBar(
                 controller: _tabController,
                 indicator: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                   color: Color(0xffaa0000),
                 ),
                 labelColor: Colors.white,
                 unselectedLabelColor: Colors.white,
                 tabs: [
                   Tab(
                     text: '빌려드림',
                   ),
                   Tab(
                     text: '빌림 ',
                   ),
                 ],
               ),
             ),
             GestureDetector(
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(240,10,10,10),
                 child: Container(
                   width: Get.width ,
                   height: Get.height * 0.03,
                   child: Row(
                     children: [
                       Icon(Icons.filter_alt_outlined,color: isTabed ==false ? Color(0xff767676) : Color(0xffaa0000),size: 20,),

                   Text("안심거래만 보기",
                           style : TextStyle(
                             color:  isTabed ==false ? Color(0xff767676) : Color(0xffaa0000),
                           fontWeight: FontWeight.w400,
                           fontFamily: "NotoSansCJKkr",
                           fontStyle:  FontStyle.normal,
                           fontSize: 14.0
                 ),
                           textAlign: TextAlign.right,),

                     ],
                   ),
                 ),
               ),
               onTap: (){
                 setState(() {
                   isTabed == true ? isTabed= false : isTabed = true;
                   print(isTabed);
                 });
               },
             ),
             Expanded(
               child: TabBarView(
                 controller: _tabController,
                 children: [
                   ListView.builder(
                     itemCount: 5,
                       itemBuilder: (BuildContext context, int index){
                     return Column(
                       children: [
                         RentDealList(),
                         Container(
                             width: Get.width*0.866 ,
                             height: 0,
                             decoration: BoxDecoration(
                                 border: Border.all(
                                     color: const Color(0xffdedede),
                                     width: 1
                                 )
                             )
                         ),
                       ],
                     );
                   }),

                   //빌림
                   ListView.builder(
                       itemCount: 5,
                       itemBuilder: (BuildContext context, int index){
                         return Column(
                           children: [
                             RentDealList(),
                             Container(
                                 width: Get.width*0.866 ,
                                 height: 0,
                                 decoration: BoxDecoration(
                                     border: Border.all(
                                         color: const Color(0xffdedede),
                                         width: 1
                                     )
                                 )
                             ),
                           ],
                         );
                       }),








                 ],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }













