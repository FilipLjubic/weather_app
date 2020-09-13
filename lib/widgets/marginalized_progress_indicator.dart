import 'package:flutter/material.dart';

class MarginalizedProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 100.0, left: MediaQuery.of(context).size.width / 2 - 30),
      child: CircularProgressIndicator(),
    );
  }
}
