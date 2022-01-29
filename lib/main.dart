import 'package:flutter/material.dart';
import 'package:mobxbloctest/features/onboard/on_board_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: OnBoardView());
  }
}
