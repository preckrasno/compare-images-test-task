import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/my_app.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => NavigationBloc()
        ..add(
          NavigationPushPageEvent(
            ImageSelectionPage.page,
          ),
        ),
      child: MyApp(),
    ),
  );
}
