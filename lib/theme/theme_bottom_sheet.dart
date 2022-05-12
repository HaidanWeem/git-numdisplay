import 'package:display_num_phone/theme/theme_display.dart';
import 'package:flutter/material.dart';

final textFieldTheme = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
  hintText: 'Search',
  labelStyle: const TextStyle(fontFamily: 'ArialBold', color: Colors.blueGrey),
  filled: true,
  fillColor: backgroundColorButtonsTxtFields,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  ),
);
