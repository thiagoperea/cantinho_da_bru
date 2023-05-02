import 'package:cantinho_da_bru/data/shopping_bag_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingBagListItem extends StatelessWidget {
  ShoppingBagListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ShoppingBagEntry item;
  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR");

  @override
  Widget build(BuildContext context) {
    String formattedValue = formatter.format(
      item.product.value * item.quantity
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            "${item.quantity}x ${item.product.name}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        Text(
          formattedValue,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        )
      ],
    );
  }
}
