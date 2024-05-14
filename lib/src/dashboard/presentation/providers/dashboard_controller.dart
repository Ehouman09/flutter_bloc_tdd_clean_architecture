

import 'package:educationapp/core/common/app/providers/tab_navigator.dart';
import 'package:educationapp/core/common/views/persistence_view.dart';
import 'package:educationapp/src/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {

  List<int> _indexHistory = [0];

  final List<Widget> _screen = [
    ChangeNotifierProvider(
      create: (_) => TabNavigator(
      TabItem(
        child: const Placeholder(),
      ),
    ),
      child: const PersistenceView(),
    ),

    ChangeNotifierProvider(
      create: (_) => TabNavigator(
        TabItem(
          child: const Placeholder(),
        ),
      ),
      child: const PersistenceView(),
    ),

    ChangeNotifierProvider(
      create: (_) => TabNavigator(
        TabItem(
          child: const Placeholder(),
        ),
      ),
      child: const PersistenceView(),
    ),

    ChangeNotifierProvider(
      create: (_) => TabNavigator(
        TabItem(
          child: const ProfileView(),
        ),
      ),
      child: const PersistenceView(),
    ),
  ];

  List<Widget> get screens => _screen;

  int _curretIndex = 3;

  int get currentIndex => _curretIndex;


  void changeIndex(int index){

    if(_curretIndex == index) return;
    _curretIndex = index;
    _indexHistory.add(index);
    notifyListeners();

  }

  void goBack(){
    if(_indexHistory.length == 1) return;
    _indexHistory.removeLast();
    _curretIndex = _indexHistory.last;
    notifyListeners();
  }

  void resetIndex(){

    _indexHistory = [0];
    _curretIndex = 0;
    notifyListeners();

  }

}
