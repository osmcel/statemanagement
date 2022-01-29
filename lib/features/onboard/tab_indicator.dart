import 'package:flutter/material.dart';
import 'package:mobxbloctest/features/onboard/on_board_model.dart';

class TabIndicator extends StatefulWidget {
  final int selectedIndex;
  const TabIndicator({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _TabIndicatorState createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabPageController;

  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget.selectedIndex) {
      _tabPageController.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.selectedIndex.toString());

    _tabPageController =
        TabController(length: OnBoardModels.onboarditems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabPageController,
    );
  }
}
