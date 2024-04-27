import 'package:flutter/material.dart';

class CustomEmpty extends StatelessWidget {
  final String text;

  const CustomEmpty({
    this.text = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          Icon(
            Icons.favorite_outline,
            size: 50.0,
            color: theme.colorScheme.primary,
          ),
          Text(text),
        ],
      ),
    );
  }
}
