import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

/// Instance created from [AppRouter] class is used in [FlowBuilder] to
/// generate pages.
class AppRouter {
  /// Method [onGeneratePages] is responsible for generating pages nad
  /// used in FlowBuilder.
  List<Page<void>> onGeneratePages(
    NavigationState state,
    List<Page<dynamic>> _,
  ) {
    final List<Page<void>> pages = [...state.pages];

    if (pages.isEmpty) return [ImageSelectionPage.page()];

    return pages;
  }
}
