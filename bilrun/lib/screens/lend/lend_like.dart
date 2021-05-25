import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';
import 'package:bilrun/screens/lend/lend_controller.dart';
import 'package:bilrun/model/product_list_model.dart';


class ProductLike extends StatefulWidget {
  @override
  _ProductLikeState createState() => _ProductLikeState();
}

class _ProductLikeState extends State<ProductLike> {

bool _isPressed =false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize : 20.0,
      icon:_isPressed? Icon(Icons.favorite) : Icon(Icons.favorite_outline,),
      color: _isPressed? mainRed : Colors.grey[200],
      onPressed:(){
        setState(() {
          _isPressed==true  ? _isPressed=false : _isPressed =true;
        });

      },

    );

  }
}

