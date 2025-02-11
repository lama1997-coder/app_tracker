import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<String> {
  CategoryCubit(String initalCategory) : super(initalCategory);

  void changeCategory(String newCurrency) {
    emit(newCurrency);
  }
}
