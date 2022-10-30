import 'package:advicer/application/core/services/theme_service.dart';
import 'package:advicer/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer/application/pages/advice/widgets/advice_field.dart';
import 'package:advicer/application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdvicerBloc(),
      child: const AdvicePage(),
    );
  }
}

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
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Text(
                        'Your advice is waiting for you!',
                        style: themeData.textTheme.headline1,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdvicerStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdvicerStateError) {
                      return ErrorMessage(message: state.message);
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(
                  title: 'Get Advice',
                  onPressed: () => BlocProvider.of<AdvicerBloc>(context).add(
                    AdviceRequestEvent(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
