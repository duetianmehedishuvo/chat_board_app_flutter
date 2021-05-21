import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/localization/app_localization.dart';
import 'package:tutorial/provider/chat_provider.dart';
import 'package:tutorial/provider/language_provider.dart';
import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/provider/theme_provider.dart';
import 'package:tutorial/theme/dark_theme.dart';
import 'package:tutorial/theme/light_theme.dart';
import 'package:tutorial/util/app_constant.dart';
import 'package:tutorial/view/screen/splash/splash_screen.dart';
import 'di_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstant.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });

    return MaterialApp(
      title: 'City University',
      locale: Provider.of<LocalizationProvider>(context).locale,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: _locals,
      home: SplashScreen(),
    );
  }
}
