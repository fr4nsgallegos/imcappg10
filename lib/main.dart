import 'package:flutter/material.dart';
import 'package:imcappg10/pages/home_page.dart';
import 'package:imcappg10/pages/imc_page.dart';
import 'package:imcappg10/pages/rich_text_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: imcPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
