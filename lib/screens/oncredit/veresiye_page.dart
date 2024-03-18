import 'package:flutter/material.dart';
import 'package:satis_programi/screens/oncredit/customer_page.dart';
import 'package:satis_programi/screens/oncredit/wholesaler_page.dart';

class VeresiyePage extends StatelessWidget {
  const VeresiyePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 0,
            bottom: const TabBar(
                tabs: [Tab(text: "MÜŞTERİ"), Tab(text: "TOPTANCI")])),
        body: const TabBarView(children: [MusteriPage(), WholeSalerPage()]),
      ),
    );
  }
}
