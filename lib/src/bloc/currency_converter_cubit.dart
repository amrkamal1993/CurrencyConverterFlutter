import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/currency_repository.dart';

part 'currency_converter_states.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepository _repo;

  CurrencyCubit(this._repo) : super(CurrencyInitial());

  Future<void> getCurrencyAsync() async {
    emit(CurrencyLoading());
    final response = await _repo.getCurrencyAsync();
    if (response?.countries != null) {
      emit(CurrencySuccess(response?.countries));
    } else {
      emit(CurrencyFailed("Cannot get the Currencies"));
    }
  }
}
