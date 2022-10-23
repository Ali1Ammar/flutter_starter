import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main(List<String> args) {}

extension RiverpodExt on BuildContext {
  ReadRiverpod get read => ProviderScope.containerOf(this).read;
  ListenRiverpod get listen => ProviderScope.containerOf(this).listen;
  ResfreshRiverpod get refresh => ProviderScope.containerOf(this).refresh;
}

typedef ReadRiverpod = Result Function<Result>(
  ProviderListenable<Result> provider,
);

typedef ListenRiverpod = ProviderSubscription<State> Function<State>(
  ProviderListenable<State> provider,
  void Function(State? previous, State next) listener, {
  bool fireImmediately,
  void Function(Object error, StackTrace stackTrace)? onError,
});

typedef ResfreshRiverpod = State Function<State>(Refreshable<State> provider);
