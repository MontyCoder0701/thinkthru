import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/rule.dart';
import 'providers/thought.dart';
import 'screens/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
