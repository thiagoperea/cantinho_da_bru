import 'package:cantinho_da_bru/data/product_entry.dart';

class ShoppingBagEntry {

  final int id;
  final ProductEntry product;
  int quantity;

  ShoppingBagEntry(this.id, this.product, this.quantity);
}