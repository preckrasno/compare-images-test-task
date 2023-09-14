import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/navigation/app_router.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => NavigationBloc()
      ..add(
        NavigationPushPageEvent(
          ImageSelectionPage.page,
        ),
      ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Compare Images",
      home: FlowBuilder(
        state: context.watch<NavigationBloc>().state,
        onGeneratePages: _appRouter.onGeneratePages,
      ),
    );
  }
}
