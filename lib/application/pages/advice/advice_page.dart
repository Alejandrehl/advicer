import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Advicer',
          style: themeData.textTheme.headline1,
        ),
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) => Provider.of<ThemeService>(
              context,
              listen: false,
            ).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: const [
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
