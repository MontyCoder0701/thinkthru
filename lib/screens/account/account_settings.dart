import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Lock App'),
            trailing: Icon(Icons.lock_outline),
            onTap: () => _handleDialogOpen(),
          )
        ],
      ),
    );
  }

  Future<void> _handleDialogOpen() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter 4 Digit Password'),
          content: TextFormField(
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}
