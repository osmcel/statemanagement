import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobxbloctest/features/onboard/on_board_model.dart';
import 'package:mobxbloctest/features/onboard/tab_indicator.dart';
import 'package:mobxbloctest/product/padding/page_padding.dart';
import 'package:mobxbloctest/product/widgets/onboard_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = "Skip";
  int _selectedIndex = 0;
  bool get _isLastPage =>
      OnBoardModels.onboarditems.length - 1 == _selectedIndex;

  bool get _isFirstPage => _selectedIndex == 0;

  void changePageState([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnableState(true);
      return;
    } else {
      _changeBackEnableState(false);
    }

    incrementPage(value);
    changeIndicator(_selectedIndex);
  }

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  void incrementPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  void changeIndicator(int index) {
    //_tabPageController.animateTo(index);
  }

  void _changeBackEnableState(bool value) {
    if (value == isBackEnable.value) return;

    isBackEnable.value = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageviewmodel(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _nextFabButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnable,
          builder: (BuildContext context, bool value, Widget? child) {
            return value
                ? const SizedBox()
                : TextButton(onPressed: () {}, child: Text(_skipTile));
          },
        ),
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.lightBlue,
              )),
    );
  }

  FloatingActionButton _nextFabButton() {
    return FloatingActionButton(
        onPressed: () {
          changePageState();
          print(_selectedIndex.toString());
        },
        child: Text(_isLastPage ? "Start" : "Next"));
  }

  PageView _pageviewmodel() {
    return PageView.builder(
        onPageChanged: (value) {
          incrementPage(value);
        },
        itemCount: OnBoardModels.onboarditems.length,
        itemBuilder: (context, index) {
          return OnBoardCard(model: OnBoardModels.onboarditems[index]);
        });
  }
}
