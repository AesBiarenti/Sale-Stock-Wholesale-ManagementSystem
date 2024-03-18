import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:satis_programi/home_page.dart';
import 'package:satis_programi/provider/theme/theme_provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1200, 790));
  }
  await Hive.initFlutter("SatisProgrami");
  await Hive.openBox<String>('color');
  final selectedColorNotifier = SelectedColorNotifier();
  selectedColorNotifier.loadColor();
  runApp(ProviderScope(overrides: [
    selectedColorProvider.overrideWith((ref) => selectedColorNotifier),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themes(ref),
      title: 'Material App',
      home: const HomePage(),
    );
  }
}
