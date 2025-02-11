import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<String> {
  CurrencyCubit(String initialCurrency) : super(initialCurrency);

  void changeCurrency(String newCurrency) {
    emit(newCurrency);
  }
}
