import 'package:cantinho_da_bru/presentation/component/loader.dart';
import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Loader(),
    );
  }
}
