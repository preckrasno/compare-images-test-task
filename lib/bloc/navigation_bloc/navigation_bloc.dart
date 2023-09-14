import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationPushPageEvent>(_onNavigationPushPageEvent);
    on<NavigationPopPageEvent>(_onNavigationPopPageEvent);
  }

  FutureOr<void> _onNavigationPushPageEvent(
      NavigationPushPageEvent event, Emitter<NavigationState> emit) {
    final pages = [...state.pages];
    event.canPop ? null : pages.removeLast();
    event.replace ? pages.clear() : null;
    pages.add(event.page);
    emit(NavigationOpenPageState(pages: pages));
  }

  FutureOr<void> _onNavigationPopPageEvent(
      NavigationPopPageEvent event, Emitter<NavigationState> emit) {
    if (state.pages.length <= 1) return null;

    final pages = [...state.pages];

    pages.removeLast();
    emit(NavigationOpenPageState(pages: pages));
  }
}
