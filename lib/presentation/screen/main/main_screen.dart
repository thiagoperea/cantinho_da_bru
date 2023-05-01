import 'package:cantinho_da_bru/presentation/screen/menu_navigator.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _menuIndex = MenuNavigator.menuTrufas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cantinho da Bru"),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: MenuNavigator.getScreen(_menuIndex),
      ),
      floatingActionButton: shouldShowSendButton()
          ? FloatingActionButton.extended(
              label: Text("Enviar pedido"),
              icon: Icon(LineIcons.whatSApp),
              onPressed: () {
                //TODO: enviar pedido
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _menuIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary.withOpacity(.60),
        selectedFontSize: 15,
        unselectedFontSize: 13,
        onTap: (int newIndex) {
          setState(() {
            _menuIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Trufas',
            icon: Icon(LineIcons.cookieBite),
          ),
          BottomNavigationBarItem(
            label: 'Salgados',
            icon: Icon(LineIcons.hamburger),
          ),
          BottomNavigationBarItem(
            label: 'Minha Sacola',
            icon: Icon(LineIcons.shoppingBasket),
          ),
        ],
      ),
    );
  }

  bool shouldShowSendButton() {
    return _menuIndex == MenuNavigator.menuShoppingBag;
    //TODO: && HAS ITEMS
  }
}
