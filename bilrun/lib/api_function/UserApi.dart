
import 'package:bilrun/api_function/UserInfo.dart';
import 'package:flutter/material.dart';
import 'UserInfo.dart';
import 'info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'UserInfo.dart';



void main() {
  runApp(UserApi());
}

class UserApi extends StatelessWidget {
  final Future<userInfo>UserInfo ;

  const UserApi({Key key, this.UserInfo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fetch data example',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("BILL RUN",style: TextStyle(fontSize: 30.0, fontWeight : FontWeight.bold,color:Colors.black),
          ),
        ),
        body: Center(
          child: FutureBuilder<userInfo>(
              future: fetchUserInfo(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      //Text('상품id'+snapshot.data.id.toString(),),
                      Text('유저이름'+snapshot.data.username.toString(),),
                      Text('닉네임'+snapshot.data.nickname.toString(),),
                      //Text('가격'+snapshot.data.price.toString(),),

                    ],
                  );
                }
                else if(snapshot.hasError){
                  print(snapshot.error);
                  return Text("에러");
                }
                return CircularProgressIndicator();
              }
          ),
        ),




      ),
    );
  }
}






Future<userInfo> fetchUserInfo() async {
  final response =
  await http.get('http://172.20.10.2:8000/api/user_list/');
  if (response.statusCode == 200) {
    return userInfo.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception("정보 불러오는데 실패하였습니다.");
  }
}
