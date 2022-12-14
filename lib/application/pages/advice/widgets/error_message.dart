import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 40.0, color: Colors.redAccent),
        const SizedBox(height: 20.0),
        Text(
          message,
          style: themeData.textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
