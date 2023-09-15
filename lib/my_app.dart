import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/navigation/app_router.dart';
import 'package:compare_images/theme/app_texts.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [MyApp] is the entry point of the application
class MyApp extends StatelessWidget {
  /// Constructor of [MyApp] class, entry point of the application
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.compareImages,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: FlowBuilder(
        state: context.watch<NavigationBloc>().state,
        onGeneratePages: _appRouter.onGeneratePages,
      ),
    );
  }
}
