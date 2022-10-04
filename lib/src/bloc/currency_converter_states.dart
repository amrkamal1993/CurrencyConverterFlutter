part of 'currency_converter_cubit.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}
class CurrencyLoading extends CurrencyState {}
class CurrencySuccess extends CurrencyState {
  final Map<String,String>? response;
  CurrencySuccess(this.response);
}
class CurrencyFailed extends CurrencyState {
  final String errorMessage;
  CurrencyFailed(this.errorMessage);
}
