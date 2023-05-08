import 'package:cantinho_da_bru/data/product_entry.dart';
import 'package:cantinho_da_bru/data/shopping_bag_entry.dart';
import 'package:flutter/widgets.dart';

class ShoppingBag extends ChangeNotifier {
  List<ShoppingBagEntry> _shoppingBag = [];

  List<ShoppingBagEntry> get shoppingBag => _shoppingBag;

  void addItem(ProductEntry item) {
    // TODO: if contains in bag, increase quantity

    var id = _shoppingBag.length;
    var entry = ShoppingBagEntry(id, item, 1);
    _shoppingBag.add(entry);

    notifyListeners();
  }

  void increaseQuantity(ShoppingBagEntry shoppingItem) {
    _shoppingBag.firstWhere((element) => shoppingItem.id == element.id).quantity++;
  }

  void decrementQuantity(ShoppingBagEntry shoppingItem) {
    //TODO: if quantity 1, remove from bag

    _shoppingBag.firstWhere((element) => shoppingItem.id == element.id).quantity--;
  }

  /***
   * Sum each item's total value
   */
  double getTotalValue() {
    double totalValue = 0.0;

    _shoppingBag.forEach((element) {
      totalValue += element.product.value * element.quantity;
    });

    return totalValue;
  }
}
