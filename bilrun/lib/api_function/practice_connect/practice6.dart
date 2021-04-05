import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//_data 리스트에 넣기위한 커스텀 클래스
class Picture {
//데이터 예제
//  [
//    {
//      "id": "0",
//      "author": "Alejandro Escamilla",
//      "width": 5616,
//      "height": 3744,
//      "url": "https://unsplash.com/...",
//      "download_url": "https://picsum.photos/..."
//    }
//  ]

  String name;
  String description;

  Picture(this.name, this.description);
}

class _HomePageState extends State<HomePage> {
  List _data = [];

  int page = 1;
  int limit = 20;

  //데이터를 꺼내오는 메서드
  _fetchData() {
    //http 라이브러리를 통해 데이터를 가져올꺼니까 get 메서드 사용
    //http.get() 메서드는 Response를 포함하고 있는 Future를 반환함
    //then()을 사용하여 Future 가 완료 될 때 실행되는 코드를 스케줄링 할 수 있다.
    //예를 들어 HTTP 요청에 시간이 걸릴 수 있으므로 http.get() 은 Future를 반환한다.
    http.get('http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/product_list/?format=json').then(
          (response) {
        //만약 서버가 OK 응답을 반환하면, json 본문을 가져옴.
        if (response.statusCode == 200) {
          // String jsonString = response.body;
          // print(jsonString);
          String jsonString = utf8.decode(response.bodyBytes);



          //convert 라이브러리를 통한 jsonDecode() 메서드
          List pictures = jsonDecode(jsonString);
          for (int i = 0; i < pictures.length; i++) {
            var picture = pictures[i];
            //새로운 pictureToAdd 인스턴스를 생성
            Picture pictureToAdd = Picture(picture['name'], picture['description']);
            print(pictureToAdd.name);

            //리스트에 추가
            setState(() {
              _data.add(pictureToAdd);
              page++;
            });
          }
          //아니면 에러
        } else {
          print('Error!!!');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP & JSON'),
        //앱바 오른쪽에 위치하는 아이콘버튼 위젯
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _fetchData();
              }),
        ],
      ),
      //동적 리스트니까 ListView.builder 로~
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          Picture picture = _data[index];
          //리턴을 해줘야 화면에 표시됨
          return Card(
            child: Column(
              children: <Widget>[
                Text("${picture.name} + ${picture.description}"),
                //Image.network('https://picsum.photos/id/${picture.id}/200/300'),
              ],
            ),
          );
        },
      ),
    );
  }
}