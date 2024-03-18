import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satis_programi/provider/theme/theme_provider.dart';

class StockPage extends ConsumerWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(selectedColorProvider);
    final opacityColor = selectedColor.withOpacity(0.1);
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              color: selectedColor.withOpacity(0.5),
            )),
        Expanded(
            flex: 10,
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(columns: [
                    DataColumn(
                        label: Text("Barkod",
                            style: Sabitler.anaFont(selectedColor))),
                    DataColumn(
                        label: Text("Ürün Adı",
                            style: Sabitler.anaFont(selectedColor))),
                    DataColumn(
                        label: Text("Adet",
                            style: Sabitler.anaFont(selectedColor))),
                    DataColumn(
                        label: Text("Alış Fiyatı",
                            style: Sabitler.anaFont(selectedColor))),
                    DataColumn(
                        label: Text("Satış Fiyatı",
                            style: Sabitler.anaFont(selectedColor))),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(TextButton(
                        child: Text('121510'),
                        onPressed: () {},
                      )),
                      DataCell(TextButton(
                        child: Text('Nescafe 3 ü 1'),
                        onPressed: () {},
                      )),
                      DataCell(TextButton(
                        child: Text('60'),
                        onPressed: () {},
                      )),
                      DataCell(TextButton(
                        child: Text('4'),
                        onPressed: () {},
                      )),
                      DataCell(TextButton(
                        child: Text('6'),
                        onPressed: () {},
                      )),
                    ])
                  ]),
                ],
              ),
            ))
      ],
    );
  }
}
