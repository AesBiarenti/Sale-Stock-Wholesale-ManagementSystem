import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satis_programi/provider/theme/theme_provider.dart';
import 'package:satis_programi/screens/sale/sale_kategories.dart';
import 'package:satis_programi/widgets/text_button.dart';

class SalePage extends ConsumerWidget {
  const SalePage({super.key});

  // Sayacı tanımla
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;

    int rowColorIndex = 0;
    final selectedColor = ref.watch(selectedColorProvider);
    final opacityColor = selectedColor.withOpacity(0.1);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "$size",
                            style: const TextStyle(
                                fontSize: 70, fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            "    TL",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                    color: opacityColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "3x",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size > 1600 ? 200 : (size < 1300 ? 100 : 150),
                        ),
                        child: TextField(
                          focusNode: FocusNode(canRequestFocus: true),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  "Barkod Değerlerini veya Adet* olarak giriniz",
                              hintStyle: TextStyle(
                                  color: selectedColor,
                                  fontFamily: "SecularOne")),
                          controller: TextEditingController(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textButton(
                        color: opacityColor, text: "İptal", onPressed: () {}),
                    const SizedBox(width: 10),
                    textButton(
                        color: opacityColor, text: "...", onPressed: () {}),
                    const SizedBox(width: 10),
                    textButton(
                        color: opacityColor,
                        text: "Veresiye",
                        onPressed: () {}),
                    const SizedBox(width: 10),
                    textButton(
                        color: opacityColor, text: "Nakit", onPressed: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Expanded(
                flex: 8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          dataRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              // Renkleri sırayla değiştir
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.08);
                              }
                              rowColorIndex++;
                              return rowColorIndex % 2 == 0
                                  ? opacityColor
                                  : Colors.transparent;
                            },
                          ),
                          columns: [
                            DataColumn(
                                label: Text("AD",
                                    style: Sabitler.anaFont(selectedColor))),
                            DataColumn(
                                label: Text("ADET",
                                    style: Sabitler.anaFont(selectedColor))),
                            DataColumn(
                                label: Text("BİRİM",
                                    style: Sabitler.anaFont(selectedColor))),
                            DataColumn(
                                label: Text("TOPLAM",
                                    style: Sabitler.anaFont(selectedColor))),
                            DataColumn(
                                label: Text("SİL",
                                    style: Sabitler.anaFont(selectedColor))),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                const DataCell(Text("Coca Cola 2.5 Lt")),
                                const DataCell(Text("2")),
                                const DataCell(Text("50")),
                                const DataCell(Text("100")),
                                DataCell(
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text("Coca Cola 2.5 Lt")),
                                const DataCell(Text("2")),
                                const DataCell(Text("50")),
                                const DataCell(Text("100")),
                                DataCell(
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                const DataCell(Text("Coca Cola 2.5 Lt")),
                                const DataCell(Text("2")),
                                const DataCell(Text("50")),
                                const DataCell(Text("100")),
                                DataCell(
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(children: [
            const Divider(),
            Expanded(
              flex: 1,
              child: Container(
                  color: opacityColor,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Barkodsuz Ürünler", style: TextStyle(fontSize: 28)),
                    ],
                  )),
            ),
            const Divider(),
            Expanded(
              flex: 15,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size > 1600 ? 5 : (size < 1300 ? 3 : 4),
                    mainAxisExtent: 160),
                itemBuilder: (context, index) {
                  return const CategoriesPage();
                },
              ),
            ),
          ]),
        )
      ],
    );
  }
}
