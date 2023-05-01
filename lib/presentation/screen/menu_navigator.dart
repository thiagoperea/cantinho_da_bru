import 'package:cantinho_da_bru/presentation/screen/salgados/salgados_screen.dart';
import 'package:cantinho_da_bru/presentation/screen/shopping_bag/shopping_bag_screen.dart';
import 'package:cantinho_da_bru/presentation/screen/trufas/trufas_screen.dart';
import 'package:flutter/material.dart';

class MenuNavigator {
  const MenuNavigator();

  static const int menuTrufas = 0;
  static const int menuSalgados = 1;
  static const int menuShoppingBag = 2;

  static Widget getScreen(int index) {
    switch (index) {
      case 0:
        return TrufasScreen();
      case 1:
        return SalgadosScreen();
      default:
        return ShoppingBagScreen();
    }
  }
}
