import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  late final theme = Theme.of(context);
  late final _accountProvider = context.read<AccountProvider>();

  @override
  Widget build(BuildContext context) {
    final isLocked = context.watch<AccountProvider>().isLocked;

    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              isLocked ? 'Lock Enabled' : 'Lock Disabled',
            ),
            trailing: Switch(
              value: isLocked,
              onChanged: (bool value) async {
                final auth = LocalAuthentication();
                final result = await auth.authenticate(
                  localizedReason:
                      'Enter Password for ThinkThru Authentication',
                );

                if (result) {
                  _accountProvider.toggleIsLocked();
                }
              },
            ),
          ),
          ListTile(
            title: Text(
              'To live is to suffer, to survive is to find some meaning in the suffering.',
              style: TextStyle(color: theme.colorScheme.outline),
            ),
            subtitle: Text(
              '-Friedrich Nietzsche',
              style: TextStyle(color: theme.colorScheme.outline),
            ),
          ),
        ],
      ),
    );
  }
}
