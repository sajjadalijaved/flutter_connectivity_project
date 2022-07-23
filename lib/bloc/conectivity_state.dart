part of 'conectivity_bloc.dart';

abstract class ConectivityState extends Equatable {
  const ConectivityState();

  @override
  List<Object> get props => [];
}

class ConectivityInitial extends ConectivityState {}

class ConnectedState extends ConectivityState {
  final ConnectivityResult connectivityResult;
  const ConnectedState(this.connectivityResult);
}

class DisconnectedState extends ConectivityState {}
