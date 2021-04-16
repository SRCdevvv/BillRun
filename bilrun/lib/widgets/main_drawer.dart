import 'package:bilrun/design/divider_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


  Widget MainDrawer(){
    return  ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red[900],
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://lh3.googleusercontent.com/proxy/iKOsCGnfn-ELJUZtto3xoKiwyhG2ly9RzC0OyB4YtSWa5SAHMBP2D3OaKYBd7sYiUJYH-xH5odVIELD9yS938x9eiRhq2c1LKq2wJw-uAZkcPxkw8zunxiyywg8mj2xaKjFw3Z079tACjubk-q-9k_uJMYDHEiWCuuji1qaeiEDDvqsZv8FjhQolVYWEoJxkyQjCNsn0I0BCsXysBMfFzoZh3pq6BukcZyhfv9Hu81rRihPf4XGs2vcRKUHWUekmFMwGlY0yHqdaF7MqIIvANuldewB4hC_3LBhcn9tuhvRlAyKL6CZY7Q'),
                ),
                accountName: Padding(
                  padding: const EdgeInsets.fromLTRB(5,20,5,0),
                  child: Text("워니",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                accountEmail: Padding(
                  padding: const EdgeInsets.fromLTRB(3,0,5,0),
                  child: Text("빌런지수 : 78",style: TextStyle(fontSize: 18),),
                ),


                ),

              DrawerListTile(Icons.check_circle_outline, '학교 인증하기'),
              OriginDivider(Colors.grey[850], 1, 10, 10),
                DrawerListTile(null, '소도구'),
                DrawerListTile(null, '캠핑 도구'),
                DrawerListTile(null, '사진 도구'),
                DrawerListTile(null, '가전제품'),
                OriginDivider(Colors.grey[850], 1, 10, 10),
                DrawerListTile(Icons.question_answer, '빌런에게 문의하기'),


            ],
          );
        }

        ListTile DrawerListTile(IconData iconData, String title){
                return ListTile(
                  leading: Icon(iconData,color: Colors.grey[850],),
                  title: Text("$title",style: TextStyle(fontSize: 18),),
                  onTap: (){},
                   );
                    }




