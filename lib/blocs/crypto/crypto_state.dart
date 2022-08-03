part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoadingState extends CryptoState {}

class CryptoLoadedState extends CryptoState {
  final List<CryptoService> cryptoList;

  const CryptoLoadedState(this.cryptoList);
  @override
  List<Object> get props => [cryptoList];
}

class CryptoFailedState extends CryptoState {}
