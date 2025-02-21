import 'package:flutter/widgets.dart';

class ModelClass extends ChangeNotifier {
  int? _pagecount;

  int? get PageCount => _pagecount;

  void clickedPage(int page) {
    _pagecount = page;
    print("Page Count: $_pagecount");
    notifyListeners();
  }
}
