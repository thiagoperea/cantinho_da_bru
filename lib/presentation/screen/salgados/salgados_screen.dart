import 'package:flutter/material.dart';

class SalgadosScreen extends StatelessWidget {
  const SalgadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectableText(
        "Ainda não temos nenhum salgado 🤪",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface
        ),
      ),
    );
  }
}
