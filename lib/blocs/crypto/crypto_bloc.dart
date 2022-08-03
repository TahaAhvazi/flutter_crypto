import 'package:bloc/bloc.dart';
import 'package:crfl/services/crypto_service.dart';
import 'package:equatable/equatable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final GetCryptoListService getCryptoListSErvice;
  CryptoBloc(this.getCryptoListSErvice) : super(CryptoInitial()) {
    on<CryptoListFetchedEvent>((event, emit) async {
      emit(CryptoLoadingState());
      final cryptoList = await getCryptoListSErvice.getCryptoList();
      emit(CryptoLoadedState(cryptoList));
      // ignore: avoid_print
      print(state);
    });
  }
}
