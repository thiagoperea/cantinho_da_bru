import 'package:cantinho_da_bru/data/product_entry.dart';
import 'package:cantinho_da_bru/domain/load_salgados.dart';
import 'package:cantinho_da_bru/domain/result_wrapper.dart';
import 'package:cantinho_da_bru/presentation/component/loader.dart';
import 'package:cantinho_da_bru/presentation/component/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalgadosScreen extends StatelessWidget {
  const SalgadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadSalgados>(
      builder: (context, loadSalgados, child) {
        switch (loadSalgados.result.runtimeType) {
          case ResultLoading:
            return Loader();
          case ResultSuccess:
            final productList = (loadSalgados.result as ResultSuccess<List<ProductEntry>>).result;
            return _buildList(productList);
          case ResultError:
            final errorMessage = (loadSalgados.result as ResultError).errorMessage;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Erro: ${errorMessage}"),
                action: SnackBarAction(
                  label: "Tentar novamente",
                  onPressed: () {
                    loadSalgados.execute();
                  },
                ),
              ),
            );

            return _buildList([]);
          default:
            return Container();
        }
      },
    );
  }

  Widget _buildList(List<ProductEntry> productList) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ProductItem(product: productList[index]);
      },
    );
  }
}
