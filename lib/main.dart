import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitch_app/core/c_shared_preferences.dart';
import 'package:twitch_app/core/models/m_user.dart';
import 'package:twitch_app/settings.dart';
import 'package:twitch_app/styles/theme.dart';

import 'common_libs.dart';
import 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  var style = const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  );

  SystemChrome.setSystemUIOverlayStyle(style);

  final u = await CSharedPreferences.getMap(SPKeys.user);

  if (u != null) {
    Settings.user = MUser.fromJson(u);
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Twitch App",
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      theme: CustomTheme().themeData(),
    );
  }
}
