import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class Sabitler {
  static ButtonStyle textButtonStyle(Color color, Color opacity) => ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(color),
      textStyle: MaterialStatePropertyAll(anaFont(color)),
      overlayColor: MaterialStatePropertyAll(opacity));

  static TextStyle tabbarFont(Color color) => TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "SecularOne",
      );

  static TextStyle anaFont(Color color) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "SecularOne",
      );

  static TextStyle appBarFontLight(Color color) => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: "SecularOne",
      );
}

ThemeData themes(WidgetRef ref) {
  final selectedColor = ref.watch(selectedColorProvider);

  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: Sabitler.anaFont(selectedColor),
      bodySmall: Sabitler.anaFont(selectedColor),
      bodyLarge: Sabitler.anaFont(selectedColor),
    ),
    tabBarTheme: TabBarTheme(
        labelStyle: Sabitler.tabbarFont(selectedColor),
        labelColor: Colors.white,
        unselectedLabelStyle: Sabitler.tabbarFont(selectedColor),
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.white,
        overlayColor: MaterialStatePropertyAll(selectedColor.withOpacity(0.1))),
    appBarTheme: AppBarTheme(
      backgroundColor: selectedColor.withOpacity(0.3),
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: "SecularOne",
          fontWeight: FontWeight.w700,
          fontSize: 36),
    ),
    textButtonTheme: TextButtonThemeData(
        style: Sabitler.textButtonStyle(
            selectedColor, selectedColor.withOpacity(0.1))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: selectedColor,
    ),
    iconTheme: IconThemeData(color: selectedColor),
  );
}

final selectedColorProvider =
    StateNotifierProvider<SelectedColorNotifier, Color>((ref) {
  return SelectedColorNotifier();
});

class SelectedColorNotifier extends StateNotifier<Color> {
  SelectedColorNotifier() : super(Colors.deepOrange.shade300);

  late final Box<String> _colorBox = Hive.box<String>('color');

  void updateColor(Color newColor) {
    state = newColor;
    _colorBox.put('selectedColor', newColor.value.toString());
  }

  void loadColor() {
    final savedColor = _colorBox.get('selectedColor');
    if (savedColor != null) {
      state = Color(int.parse(savedColor));
    }
  }
}
