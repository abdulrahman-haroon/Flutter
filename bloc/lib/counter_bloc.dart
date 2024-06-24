import 'dart:async';

import 'package:bloc/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final StreamController<int> _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;
  final StreamController<CounterEvent> _counterEventController=StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;
}
