part of 'navigation_bloc.dart';

/// This file contains the [NavigationState] class and its subclasses.
/// [NavigationState] is a sealed class that represents the current state of
/// the navigation in the app.
/// It contains a list of [Page] objects that represent the pages that are
/// currently open.
sealed class NavigationState {
  /// The pages that are currently open.
  final List<Page<void>> pages;

  /// Creates a [NavigationState] instance.
  const NavigationState({
    required this.pages,
  });
}

/// [NavigationInitial] is a subclass of [NavigationState] that represents
/// the initial state of the navigation.
/// It contains an empty list of pages.
final class NavigationInitial extends NavigationState {
  /// Creates a [NavigationInitial] instance.
  const NavigationInitial({
    super.pages = const [],
  });
}

/// [NavigationOpenPageState] is a subclass of [NavigationState] that represents
/// the state of the navigation when a page is open.
final class NavigationOpenPageState extends NavigationState {
  /// Creates a [NavigationOpenPageState] instance.
  const NavigationOpenPageState({
    required super.pages,
  });
}
