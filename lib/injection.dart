import 'package:app_tracker/data/datasource/remote/remote_datasource.dart';
import 'package:app_tracker/domain/repositories/auth_repository.dart';
import 'package:app_tracker/domain/repositories/expense_repository.dart';
import 'package:app_tracker/domain/usecases/add_expenses.dart';
import 'package:app_tracker/domain/usecases/get_all_expense.dart';
import 'package:app_tracker/domain/usecases/get_monthly_expense.dart';
import 'package:app_tracker/domain/usecases/register_usecase.dart';
import 'package:app_tracker/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_tracker/presentation/bloc/cubit/category_cupit.dart';
import 'package:app_tracker/presentation/bloc/cubit/currency_cupit.dart';
import 'package:app_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';

import 'data/datasource/local/local_data_source.dart';
import 'data/repositories/auth_repository_imp.dart';

import 'data/repositories/expense_repository_impl.dart';
import 'domain/usecases/check_auth_status.dart';
import 'domain/usecases/delete_expense.dart';
import 'domain/usecases/edit_expense.dart';
import 'domain/usecases/login_usecase.dart';


final locator = GetIt.instance;
void init() {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => ExpenseLocalDataSource());

  locator.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey<NavigatorState>());

  //bloc
  locator.registerFactory(() => AuthBloc( registerUseCase: locator(), loginUseCase: locator(), checkAuthStatus: locator()));
  locator.registerFactory(() => ExpenseBloc(addExpense: locator(), getMonthlyExpense: locator(), getAllExpense: locator(), editExpenseUseCase: locator(), deleteExpenseUseCase: locator()));
  locator.registerFactory(() => CurrencyCubit('USD'));
  locator.registerFactory(() => CategoryCubit('Food'));




//repo
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
  locator.registerLazySingleton<ExpenseRepository>(
          () => ExpenseRepositoryImpl(locator()));

  //useCase
  locator.registerLazySingleton(() => LoginUseCase( locator()));
  locator.registerLazySingleton(() => CheckAuthStatus( locator()));

  locator.registerLazySingleton(
      () => RegisterUseCase( locator()));
  locator.registerLazySingleton(() => GetMonthlyExpense( locator()));
  locator.registerLazySingleton(() => AddExpense( locator()));
  locator.registerLazySingleton(() => GetAllExpense( locator()));
  locator.registerLazySingleton(() => EditExpense( locator()));
  locator.registerLazySingleton(() => DeleteExpense( locator()));




  //dataSource
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl( locator()));
  //dio

}
