import 'package:cantinho_da_bru/data/product_entry.dart';
import 'package:cantinho_da_bru/domain/result_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class LoadSalgados extends ChangeNotifier {
  ResultWrapper result = ResultIdle();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void execute() {
    result = ResultLoading();
    notifyListeners();

    firestore
        .collection("salgados")
        .withConverter(
          fromFirestore: (snapshot, _) => ProductEntry.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .get()
        .then(
      (QuerySnapshot<ProductEntry> snapshot) {
        List<ProductEntry> mappedResults = snapshot.docs.map((entry) => entry.data()).toList(growable: false);

        result = ResultSuccess(mappedResults);
        notifyListeners();
      },
    );
  }
}
