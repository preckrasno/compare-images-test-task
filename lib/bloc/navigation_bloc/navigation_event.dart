part of 'navigation_bloc.dart';

/// This file contains the [NavigationEvent] sealed class and its subclasses.
///
/// [NavigationEvent] is used to represent events that trigger navigation
/// actions in the app.
/// It is a sealed class, meaning that it can only be extended within this file.
///
/// [NavigationPushPageEvent] is a subclass of [NavigationEvent] that represents
/// a request to push a new page onto the navigation stack.
/// It contains the [NavigationPushPageEvent.page] to be pushed, a boolean
/// [NavigationPushPageEvent.canPop] indicating whether
/// the new page can be popped off the stack, and a boolean
/// [NavigationPushPageEvent.replace] indicating
/// whether the new page should replace the current page in the stack.
///
/// [NavigationPopPageEvent] is a subclass of [NavigationEvent] that represents
/// a request to pop the current page off the navigation stack.
///
/// Example usage:
///
/// ```dart
/// final event = NavigationPushPageEvent(MyPage());
/// ```
sealed class NavigationEvent {
  /// Creates a [NavigationEvent] instance.
  const NavigationEvent();
}

/// A [NavigationEvent] that represents a request to push a new page onto
/// the navigation stack.
final class NavigationPushPageEvent extends NavigationEvent {
  /// The page to be pushed.
  final Page<void> page;

  /// Whether the new page can be popped off the stack.
  final bool canPop;

  /// Whether the new page should replace all pages in the stack.
  final bool replace;

  /// Creates a [NavigationPushPageEvent] instance.
  NavigationPushPageEvent(
    this.page, {
    this.canPop = true,
    this.replace = false,
  });
}

/// A [NavigationEvent] that represents a request to pop the current page off
final class NavigationPopPageEvent extends NavigationEvent {}
