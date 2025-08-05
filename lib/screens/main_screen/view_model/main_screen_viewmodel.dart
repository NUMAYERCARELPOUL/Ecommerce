import 'package:flutter/cupertino.dart';

import '../../cart_screen/view/cart_screen_view.dart';
import '../../home_screen/view/home_screen_view.dart';

class MainScreenViewModel extends ChangeNotifier{
  int currentIndex = 0;


  final List<Widget> screens = [
    ProductListScreen(),
    CartScreenView(),
    Center(child: Text("Profile Screen")),
  ];
  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}