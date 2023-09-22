import 'package:twitch_app/common_libs.dart';

class CustomTheme with ChangeNotifier {
  static const white = Colors.white;
  static const black = Colors.black;
  static const yellowWarning = Color.fromARGB(255, 215, 195, 8);
  static const selectColor = Color.fromARGB(255, 164, 188, 207);

  ThemeData themeData() {
    return ThemeData(
      fontFamily: "Roboto",
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: Colors.grey,
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
      ),
    );
  }
}
