import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'repositories/local.dart';
import 'repositories/shared_preferences.dart';
import 'screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.initialize();
  await SharedPreferencesRepository.initialize();

  final accountProvider = AccountProvider();
  if (accountProvider.isLocked) {
    final auth = LocalAuthentication();
    await auth.authenticate(
      localizedReason: 'Enter Password for ThinkThru Authentication',
    );
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
    late final theme = Theme.of(context);

    return MaterialApp(
      title: 'ThinkThru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colorScheme.primaryContainer,
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
