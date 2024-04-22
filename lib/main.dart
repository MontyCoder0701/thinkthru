import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThinkThru',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text('My Thoughts'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Title'),
            subtitle: Text('Preview Text'),
            trailing: Text('Date'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add new thought'),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_alt_outlined),
            label: 'Thoughts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel_outlined),
            label: 'Rules',
          ),
        ],
      ),
    );
  }
}
