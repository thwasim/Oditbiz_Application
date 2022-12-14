import 'package:flutter/material.dart';
import 'package:oditbiz/app/custom/textshadow.dart';
import 'package:oditbiz/app/page/introduction/introduction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: DecoratedInputBorder(
            child: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
            shadow: const BoxShadow(
              color: Color.fromARGB(255, 214, 210, 210),
              blurRadius: 7,offset: Offset.zero
            ),
          ),
        ),
      ),
      home: const IntroductionScreen(),
    );
  }
}
