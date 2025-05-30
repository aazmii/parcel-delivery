import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        Colors,
        ElevatedButton,
        ElevatedButtonThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        RoundedRectangleBorder,
        CardThemeData;

final roundedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);

final textFieldBorder = InputDecorationTheme(
  focusedBorder:
      OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.circular(15),
  ),
);

final cardTheme = CardThemeData(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);
