import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SetController<T> extends ChangeNotifier {
  Set<T> set = {};

  add(T val) {
    set.add(val);
    notifyListeners();
  }

  toggle(T val) {
    if (contains(val)) {
      remove(val);
    } else {
      add(val);
    }
  }

  remove(T val) {
    set.remove(val);
    notifyListeners();
  }

  clear() {
    set.clear();
    notifyListeners();
  }

  bool contains(T val) => set.contains(val);

  List<T> getChecked() => set.toList();
}

SetController<T> useSetHook<T>() {
  return useListenable(useMemoized(() => SetController<T>()));
}
