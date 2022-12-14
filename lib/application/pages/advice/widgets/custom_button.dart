import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () => onPressed(),
      child: Material(
        elevation: 20.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: themeData.colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Text(
              title,
              style: themeData.textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
