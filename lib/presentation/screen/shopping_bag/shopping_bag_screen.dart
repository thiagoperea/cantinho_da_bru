import 'package:cantinho_da_bru/domain/shopping_bag.dart';
import 'package:cantinho_da_bru/presentation/component/loader.dart';
import 'package:cantinho_da_bru/presentation/screen/shopping_bag/shopping_bag_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShoppingBagScreen extends StatelessWidget {
  ShoppingBagScreen({Key? key}) : super(key: key);

  final bool isLoading = false;
  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR");

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Loader(),
      );
    }

    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.75,
        heightFactor: 0.8,
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              children: [
                Text(
                  "Produtos na sacola",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
                SizedBox(height: 48),
                Expanded(
                  child: Consumer<ShoppingBag>(builder: (context, shoppingBag, child) {
                    return ListView.separated(
                      itemBuilder: (context, index) => ShoppingBagListItem(item: shoppingBag.shoppingBag[index]),
                      separatorBuilder: (context, index) => Divider(height: 24),
                      itemCount: shoppingBag.shoppingBag.length,
                    );
                  }),
                ),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer<ShoppingBag>(
                    builder: (context, useCase, child) {
                      var formattedValue = formatter.format(useCase.getTotalValue());

                      return Text(
                        "Total: ${formattedValue}",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
