import 'package:display_num_phone/theme/theme_display.dart';
import 'package:display_num_phone/widgets/main_display/bottom_sheet/bottom_sheet_widget.dart';
import 'package:display_num_phone/widgets/main_display/display_number_phone/main_display_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DisplayApp());
}

class DisplayApp extends StatelessWidget {
  const DisplayApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DisplayNumPhone',
        theme: themeMainDisplay,
        routes: {
          '/': (context) => MainDisplayWidget(),
          '/bottom_sheet': (context) => const ChooseCountryW(),
          // '/bottom_sheet/': (context) {
          //   final codeFlag =
          //       ModalRoute.of(context)?.settings.arguments as String;
          //   return MainDisplayWidget(flagCode: codeFlag);
          // }
          
        },
        );
  }
}
