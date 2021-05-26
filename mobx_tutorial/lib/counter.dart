import 'package:mobx/mobx.dart';

class Counter {
  Counter() {
    increment = Action(_increment);
  }

  Observable _count = Observable(0);

  int get count => _count.value;

  Action increment;

  void _increment() {
    _count.value++;
  }
}
