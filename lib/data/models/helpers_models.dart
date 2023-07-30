import 'dart:async';

import 'package:flutter/foundation.dart';

class BlocEventState<E, S> {
  final S state;
  final E event;
  BlocEventState(this.event, this.state);

  @override
  bool operator ==(covariant BlocEventState<E, S> other) {
    if (identical(this, other)) return true;

    return other.state == state && other.event == event;
  }

  @override
  int get hashCode => state.hashCode ^ event.hashCode;
}

class DeBouncer {
  int milliseconds;
  Timer? timer;
  DeBouncer(this.milliseconds);

  run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
