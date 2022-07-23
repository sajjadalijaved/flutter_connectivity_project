part of 'conectivity_bloc.dart';

abstract class ConectivityEvent  {
  const ConectivityEvent();

}

class ConnectedEvent extends ConectivityEvent {
  final ConnectivityResult connectivityResult;
  const ConnectedEvent(this.connectivityResult);
}

class DisconectedEvent extends ConectivityEvent {}
