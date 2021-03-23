import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class RedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 3,
      color: Colors.red[900],
      thickness: 10,
      indent: 0,
      endIndent: 0,
    );
  }
}
