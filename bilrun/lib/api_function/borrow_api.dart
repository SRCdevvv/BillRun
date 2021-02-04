//
// import 'package:flutter/material.dart';
// import '../info.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
//
//
//
// void main() {
//   runApp(BorrowApi());
// }
//
// class BorrowApi extends StatelessWidget {
//   final Future<Info> info;
//   const BorrowApi({this.info});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'fetch data example',
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("BULL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),
//           ),
//         ),
//         body: Center(
//           child: FutureBuilder<Info>(
//               future: info,
//               builder: (context, snapshot){
//                 if(snapshot.hasData){
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       //Text('상품id'+snapshot.data.id.toString(),),
//                       Text('상품명'+snapshot.data.name.toString(),),
//                       Text('설명'+snapshot.data.description.toString(),),
//                       //Text('가격'+snapshot.data.price.toString(),),
//
//                     ],
//                   );
//                 }
//                 else if(snapshot.hasError){
//                   print(snapshot.error);
//                   return Text("에러");
//                 }
//                 return CircularProgressIndicator();
//               }
//           ),
//         ),
//
//
//
//
//       ),
//     );
//   }
// }
//
// Future<Info> fetchInfo()async{
//   final response =
//   await http.get('http://172.30.1.17:8000/api/lend_product_list');
//   if(response.statusCode == 200){
//     return Info.fromJson( jsonDecode(response.body));
//
//
//   }
//   else{
//     throw Exception("정보 불러오는데 실패하였습니다.");
//   }
// }