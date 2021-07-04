import 'package:bilrun/design/usedColors.dart';
import 'package:flutter/material.dart';

class ProductLike extends StatefulWidget {
  double iconSize;
  ProductLike({@required this.iconSize});

  @override
  _ProductLikeState createState() => _ProductLikeState(iconSize: iconSize);
}

class _ProductLikeState extends State<ProductLike> {
  bool _isPressed = false;

  double iconSize;
  _ProductLikeState({@required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      icon: _isPressed
          ? Icon(Icons.favorite)
          : Icon(
              Icons.favorite_outline,
            ),
      color: _isPressed ? mainRed : Colors.grey[200],
      onPressed: () {
        setState(() {
          _isPressed == true ? _isPressed = false : _isPressed = true;
        });
      },
    );
  }
}
