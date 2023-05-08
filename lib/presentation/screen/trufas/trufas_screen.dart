import 'package:cantinho_da_bru/data/product_entry.dart';
import 'package:cantinho_da_bru/domain/load_trufas.dart';
import 'package:cantinho_da_bru/domain/result_wrapper.dart';
import 'package:cantinho_da_bru/presentation/component/loader.dart';
import 'package:cantinho_da_bru/presentation/component/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrufasScreen extends StatefulWidget {
  const TrufasScreen({Key? key}) : super(key: key);

  @override
  State<TrufasScreen> createState() => _TrufasScreenState();
}

class _TrufasScreenState extends State<TrufasScreen> {
  @override
  void initState() {
    Provider.of<LoadTrufas>(context, listen: false).execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadTrufas>(
      builder: (context, loadTrufas, child) {
        switch (loadTrufas.result.runtimeType) {
          case ResultLoading:
            return Loader();
          case ResultSuccess<List<ProductEntry>>:
            final productList = (loadTrufas.result as ResultSuccess).result;
            return _buildList(productList);
          case ResultError:
            final errorMessage = (loadTrufas.result as ResultError).errorMessage;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Erro: ${errorMessage}"),
                action: SnackBarAction(
                  label: "Tentar novamente",
                  onPressed: () {
                    loadTrufas.execute();
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
