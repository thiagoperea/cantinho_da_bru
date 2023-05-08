import 'package:cantinho_da_bru/data/product_entry.dart';
import 'package:cantinho_da_bru/domain/shopping_bag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product}) : super(key: key);

  final ProductEntry product;

  final NumberFormat formatter = NumberFormat.simpleCurrency(locale: "pt_BR");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  SizedBox(height: 12),
                  _buildDescription(context),
                  Text(
                    formatter.format(product.value),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.all(16),
              ),
              child: Text("Comprar"),
              onPressed: () {
                var useCase = context.read<ShoppingBag>();

                useCase.addItem(product);

                ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                  SnackBar(
                    content: Text("Adicionado com sucesso!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    if (product.description.isEmpty) {
      return Container();
    }

    return Column(
      children: [
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
