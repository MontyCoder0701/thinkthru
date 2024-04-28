import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:thinkthru/color_scheme.dart';

import 'providers/providers.dart';
import 'repositories/local.dart';
import 'repositories/shared_preferences.dart';
import 'screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.initialize();
  await SharedPreferencesRepository.initialize();

  final sharedPreferencesRepository = SharedPreferencesRepository();
  final isLocked = sharedPreferencesRepository.getBool('isLocked');

  final accountProvider = AccountProvider();
  accountProvider.isLocked = isLocked ?? false;

  if (accountProvider.isLocked) {
    final auth = LocalAuthentication();

    try {
      await auth.authenticate(
        localizedReason: 'Enter Password for ThinkThru Authentication',
      );
    } on PlatformException {
      exit(0);
    }
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => accountProvider),
        ChangeNotifierProvider(create: (_) => RuleProvider()),
        ChangeNotifierProvider(create: (_) => ThoughtProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThinkThru',
      theme: ThemeData(
        colorScheme: CustomColorScheme.light,
        useMaterial3: true,
        splashColor: CustomColorScheme.light.primaryContainer,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          iconTheme: IconThemeData(
            color: CustomColorScheme.light.primary,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(elevation: 0.0),
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(elevation: 0.0),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.0,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
