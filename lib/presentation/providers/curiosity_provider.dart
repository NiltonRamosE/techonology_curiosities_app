import 'package:flutter/material.dart';
import '../../domain/entities/curiosity.dart';
import '../../domain/services/get_curiosities.dart';

class CuriosityProvider extends ChangeNotifier {
  final GetCuriosities getCuriosities;

  CuriosityProvider(this.getCuriosities);

  List<Curiosity> items = [];
  bool isLoading = false;

  Future<void> loadCuriosities() async {
    isLoading = true;
    notifyListeners();

    items = await getCuriosities();

    isLoading = false;
    notifyListeners();
  }
}
