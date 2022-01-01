import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(customThemes[0].theme);

  void changeTheme(int themeIndex) {
    emit(customThemes[themeIndex].theme);
  }
}

class _CustomTheme {
  _CustomTheme({
    required this.themeName,
    required this.theme,
  });
  final String themeName;
  final ThemeData theme;
}

List<_CustomTheme> customThemes = <_CustomTheme>[
  _CustomTheme(
    themeName: 'Light Theme',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xff0C143F),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      errorColor: const Color(0xFFFD024A),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: const Color(0xff248598),
        selectionColor: const Color(0xff248598).withOpacity(0.6),
      ),
      fontFamily: 'Muli',
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      pageTransitionsTheme: _pageTransitionsTheme,
    ),
  ),
];

ColorScheme _colorScheme = const ColorScheme.light(
  primary: Color(0xFFffffff),
  secondary: Color(0xff424259),
  onSecondary: Color(0xFF7b7b8b),
  background: Color(0xFFf7fafb),
);

const double font1 = 72.0;
const double font2 = 62.0;
const double font3 = 52.0;
const double font4 = 42.0;
const double font5 = 32.0;
const double font6 = 26.0;
const double font7 = 22.0;
const double font8 = 18.0;
const double font9 = 16.0;
const double font10 = 12.0;
const double font11 = 10.0;

/// `headline 1` is font size 72, `headline 2` is 62 `headline 3` is 52, `headline 4` is 42 and so on
TextTheme _textTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: font1,
  ),
  headline2: TextStyle(
    fontSize: font2,
  ),
  headline3: TextStyle(
    fontSize: font3,
  ),
  headline4: TextStyle(
    fontSize: font4,
  ),
  headline5: TextStyle(
    fontSize: font5,
  ),
  headline6: TextStyle(
    fontSize: font6,
  ),
  caption: TextStyle(
    fontSize: font7,
  ),
  bodyText1: TextStyle(
    fontSize: font8,
  ),
  bodyText2: TextStyle(
    fontSize: font9,
  ),
  subtitle1: TextStyle(
    fontSize: font10,
  ),
  subtitle2: TextStyle(
    fontSize: font11,
  ),
);

const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.linux: ZoomPageTransitionsBuilder(),
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
  },
);
