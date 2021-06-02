
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/data/repository/chat_repo.dart';
import 'package:tutorial/data/repository/language_repo.dart';
import 'package:tutorial/provider/chat_provider.dart';
import 'package:tutorial/provider/language_provider.dart';
import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/provider/theme_provider.dart';


final sl = GetIt.instance;

Future<void> init() async {

  // Repository
  sl.registerLazySingleton(() => LanguageRepo());
  sl.registerLazySingleton(() => ChatRepo());

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LanguageProvider(languageRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
