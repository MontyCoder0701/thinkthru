import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final String initialValue;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int maxLines;

  const CustomInput({
    this.title = '',
    this.initialValue = '',
    this.onSaved,
    this.validator,
    this.readOnly = false,
    this.maxLines = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text(title)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            validator: validator,
            initialValue: initialValue,
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
            readOnly: readOnly,
            onSaved: onSaved,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
