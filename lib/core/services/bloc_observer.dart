// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Error: $error');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Create: $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('Close: $bloc');
  }
}
