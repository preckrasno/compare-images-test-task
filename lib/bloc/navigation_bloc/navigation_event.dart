part of 'navigation_bloc.dart';

sealed class NavigationEvent {
  const NavigationEvent();
}

final class NavigationPushPageEvent extends NavigationEvent {
  NavigationPushPageEvent(
    this.page, {
    this.canPop = true,
    this.replace = false,
  });

  final Page<void> page;
  final bool canPop;
  final bool replace;
}

final class NavigationPopPageEvent extends NavigationEvent {}
