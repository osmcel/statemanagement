class OnBoardModel {
  final String title;
  final String desc;
  final String imageName;

  OnBoardModel(this.title, this.desc, this.imageName);

  String get imagewithPath => 'asset/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnBoardModel> onboarditems = [
    OnBoardModel("Order Your Food1",
        "Now you can order food any time right from your mobile", "ic_chef"),
    OnBoardModel(
        "Order Your Food2",
        "Now you can order food any time right from your mobile",
        "ic_delivery"),
    OnBoardModel("Order Your Food3",
        "Now you can order food any time right from your mobile", "ic_order"),
  ];
}
