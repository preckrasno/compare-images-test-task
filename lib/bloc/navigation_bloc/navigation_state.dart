part of 'navigation_bloc.dart';

sealed class NavigationState {
  const NavigationState({
    required this.pages,
  });

  final List<Page<void>> pages;
}

final class NavigationInitial extends NavigationState {
  const NavigationInitial({
    super.pages = const [],
  });
}

final class NavigationOpenPageState extends NavigationState {
  const NavigationOpenPageState({
    required super.pages,
  });
}
