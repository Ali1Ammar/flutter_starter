import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/main/route.dart';

final detialsProvider = StateNotifierProvider<DetialsNotifier, int>((ref) {
  final args = ref.read(appRouterProvider).current.argsAs<DetialsRouteArgs>();
  return DetialsNotifier(args.id);
});

class DetialsNotifier extends StateNotifier<int> {
  DetialsNotifier(int intialState) : super(intialState);
}
