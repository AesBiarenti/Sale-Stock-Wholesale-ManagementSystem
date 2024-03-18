import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satis_programi/provider/theme/theme_provider.dart';
import 'package:satis_programi/screens/oncredit/veresiye_page.dart';
import 'package:satis_programi/screens/sale/sale_page.dart';
import 'package:satis_programi/screens/stock/stock_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(selectedColorProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SATIŞ STOK PROGRAMI"),
          actions: [
            IconButton(
              onPressed: () {
                showColorPaletteDialog(context, ref);
              },
              icon: Icon(
                Icons.palette,
                color: selectedColor,
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outlined,
                color: selectedColor,
                size: 36,
              ),
            ),
          ],
          bottom: const TabBar(tabs: [
            Tab(text: "SATIŞ"),
            Tab(text: "STOK"),
            Tab(text: "VERESİYE")
          ]),
        ),
        body: const TabBarView(children: [
          SalePage(),
          StockPage(),
          VeresiyePage(),
        ]),
      ),
    );
  }

  void showColorPaletteDialog(BuildContext context, WidgetRef ref) async {
    final selectedColor = ref.watch(selectedColorProvider);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Renk Paleti'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildColorRadioButton(
                  "Gri", Colors.blueGrey.shade900, selectedColor, ref, context),
              _buildColorRadioButton(
                  "Mavi", Colors.blue.shade900, selectedColor, ref, context),
              _buildColorRadioButton(
                  "Mor", Colors.deepPurple, selectedColor, ref, context),
              _buildColorRadioButton(
                  "Kırmızı", Colors.red.shade900, selectedColor, ref, context),
              _buildColorRadioButton(
                  "Yeşil", Colors.green.shade900, selectedColor, ref, context),
              _buildColorRadioButton("Limon Yeşili", Colors.lightGreen.shade900,
                  selectedColor, ref, context),
              _buildColorRadioButton("Turuncu", Colors.deepOrange.shade900,
                  selectedColor, ref, context),
              _buildColorRadioButton(
                  "Pembe", Colors.pink.shade900, selectedColor, ref, context),
              _buildColorRadioButton("İndigo", Colors.indigo.shade900,
                  selectedColor, ref, context),
              _buildColorRadioButton(
                  "Teal", Colors.teal.shade900, selectedColor, ref, context),
              _buildColorRadioButton(
                  "Siyah", Colors.black, selectedColor, ref, context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColorRadioButton(String text, Color color, Color selectedColor,
      WidgetRef ref, BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Radio<Color>(
        value: color,
        groupValue: selectedColor,
        onChanged: (selectedColor) {
          ref.read(selectedColorProvider.notifier).updateColor(selectedColor!);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
