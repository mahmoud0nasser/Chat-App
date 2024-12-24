import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context,
    String message,
    Color? color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        // backgroundColor: Colors.orange,
        padding: EdgeInsets.only(
          top: 30.0,
          bottom: 30.0,
        ),
        content: Text(
          message,
          // 'Created Successfully...',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }