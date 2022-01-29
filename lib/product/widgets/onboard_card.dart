import 'package:flutter/material.dart';
import 'package:mobxbloctest/features/onboard/on_board_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({Key? key, required this.model}) : super(key: key);

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        model.title,
        style: Theme.of(context).textTheme.headline4,
      ),
      Text(model.desc),
      Image.asset(model.imagewithPath),
    ]);
  }
}
