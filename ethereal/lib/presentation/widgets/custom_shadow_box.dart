import 'package:flutter/material.dart';

Widget customShadowBox(BuildContext context) {
  return SafeArea(
    child: Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: .circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            // spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
    ),
  );
}
