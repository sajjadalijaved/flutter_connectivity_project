import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'conectivity_event.dart';
part 'conectivity_state.dart';

class ConectivityBloc extends Bloc<ConectivityEvent, ConectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;

  ConectivityBloc() : super(ConectivityInitial()) {
    on<ConnectedEvent>((event, emit) {
      emit(ConnectedState(event.connectivityResult));
    });
    on<DisconectedEvent>((event, emit) => emit(DisconnectedState()));
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        add(DisconectedEvent());
      } else {
        add(ConnectedEvent(result));
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
