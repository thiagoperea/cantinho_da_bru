import 'package:cantinho_da_bru/mock/mock_data.dart';
import 'package:cantinho_da_bru/presentation/component/product_item.dart';
import 'package:flutter/material.dart';

class TrufasScreen extends StatelessWidget {
  const TrufasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var truffles = MockData.generateTruffles();

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: truffles.length,
      itemBuilder: (context, index) {
        return ProductItem(product: truffles[index]);
      },
    );
  }
}
