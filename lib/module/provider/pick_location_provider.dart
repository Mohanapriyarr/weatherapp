import 'package:flutter/material.dart';

class PickLocationProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  final TextEditingController searchController = TextEditingController();

  List<String> cityList = [
    'Coimbatore',
    'Tirupur',
    'Erode',
    'Trichy',
    'Chennai',
    'Salem',
    'Madurai',
    'Nagercoil',
    'Tirunelveli',
    'Kerala'
  ];
  List<String> searchListItem = [
    'Coimbatore',
    'Tirupur',
    'Erode',
    'Trichy',
    'Chennai',
    'Salem',
    'Madurai',
    'Nagercoil',
    'Tirunelveli',
    'Kerala'
  ];

  Future<void> searchList() async {
    searchListItem = cityList
        .where((element) =>
            element.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
