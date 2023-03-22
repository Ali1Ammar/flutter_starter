import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeControllerProvider = StateNotifierProvider.autoDispose((ref) {
  return HomeController();
});

class HomeController extends StateNotifier<int> {
  HomeController() : super(0);
}
