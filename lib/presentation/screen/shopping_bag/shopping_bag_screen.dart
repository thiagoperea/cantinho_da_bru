import 'package:cantinho_da_bru/presentation/component/loader.dart';
import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({Key? key}) : super(key: key);

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Loader(),
      );
    }

    return Center(
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              Text("Items na sacola:"),
              SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: Text("Trufa de chocolate"),
                  ),
                  Text("R\$ 6,00")
                ],
              ),
              Divider(), //TODO: create new divider
              Row(
                children: [
                  Expanded(
                    child: Text("Trufa de chocolate"),
                  ),
                  Text("R\$ 6,00")
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
