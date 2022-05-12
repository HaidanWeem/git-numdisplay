import 'package:flutter/material.dart';

//Colors
final themeMainDisplay =
    ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(143, 172, 251, 1));
const backgroundColorButtonsTxtFields = Color.fromRGBO(184, 201, 253, 1);

//Decoration TextField
const decorationTextField = InputDecoration(
    hintText: '(123) 123-1234',
    fillColor: backgroundColorButtonsTxtFields,
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide.none,
    ));
