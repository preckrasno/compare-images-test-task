import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

/// A [Bloc] that handles navigation events and manages the navigation state.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  /// Creates [NavigationBloc] instance.
  NavigationBloc() : super(const NavigationInitial()) {
    on<NavigationPushPageEvent>(_onNavigationPushPageEvent);
    on<NavigationPopPageEvent>(_onNavigationPopPageEvent);
  }

  /// Handles the [NavigationPushPageEvent] by adding the new page to
  /// the state's pages list.
  /// If [NavigationPushPageEvent.canPop] is false, the last page in the list is
  /// removed.
  /// If [NavigationPushPageEvent.replace] is true, the pages list is cleared
  /// before adding
  /// the new page.
  FutureOr<void> _onNavigationPushPageEvent(
    NavigationPushPageEvent event,
    Emitter<NavigationState> emit,
  ) {
    final pages = [...state.pages];

    if (!event.canPop) {
      pages.removeLast();
    }

    if (event.replace) {
      pages.clear();
    }

    pages.add(event.page);
    emit(NavigationOpenPageState(pages: pages));
  }

  /// Handles the [NavigationPopPageEvent] by removing the last page from
  /// the state's pages list.
  FutureOr<void> _onNavigationPopPageEvent(
    NavigationPopPageEvent event,
    Emitter<NavigationState> emit,
  ) {
    if (state.pages.length <= 1) return null;

    final pages = [...state.pages];

    pages.removeLast();
    emit(NavigationOpenPageState(pages: pages));
  }
}
