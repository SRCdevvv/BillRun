import 'package:flutter/material.dart';
import 'package:bilrun/widgets/search.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search),
        iconSize: 38.0,
        color: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchbarApp()),
          );
        });
  }
}
