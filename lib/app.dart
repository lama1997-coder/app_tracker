import 'package:app_tracker/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_tracker/presentation/bloc/cubit/category_cupit.dart';
import 'package:app_tracker/presentation/bloc/cubit/currency_cupit.dart';
import 'package:app_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:app_tracker/presentation/pages/analysis/import.dart';
import 'package:app_tracker/presentation/pages/auth/registration/import.dart';
import 'package:app_tracker/presentation/pages/expense/import.dart';
import 'package:app_tracker/presentation/pages/home/import.dart';
import 'package:app_tracker/presentation/pages/onboarding/import.dart';
import 'package:app_tracker/presentation/pages/splash/import.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/src/material_localizations.dart';
import 'core/utils/themedata.dart';
import 'domain/entities/expense_entity.dart';
import 'generated/l10n.dart';
import '././injection.dart' as di;

final _router = GoRouter(
  initialLocation: "/splash",
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthInitial) {
      print("AuthState is AuthInitial");
      print("Current path: ${state.fullPath}");
      return state.fullPath == "/splash" || state.fullPath == "/onboarding"
          ? null
          : "/splash";
    } else if (authState is AuthSuccess) {
      print("AuthState is AuthSuccess");
      print("Current path: ${state.fullPath}");
      return state.fullPath == "/expenseform" ||
              state.fullPath == '/analysispage'
          ? null
          : "/home";
    } else if (authState is AuthFailure) {
      print("AuthState is AuthFailure");
      print("Current path: ${state.fullPath}");
      return state.fullPath == "/login" ||
              state.fullPath == "/splash" ||
              state.fullPath == "/register" ||
              state.fullPath == "/onboarding"
          ? null
          : "/login";
    }
    return null;
  },
  routes: [
    GoRoute(
      path: "/splash",
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => AuthScreen(
        isLogin: true,
      ),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => AuthScreen(
        isLogin: false,
      ),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: "/analysispage",
      builder: (context, state) => const AnalysisPage(),
    ),
    GoRoute(
      path: '/expenseform',
      builder: (BuildContext context, GoRouterState state) {
        final extra = state.extra;
        if (extra != null && extra is Map<String, dynamic>) {
          final index = extra['index'];
          final expense = extra['expense'] as Expense; // Cast to Expense type

          return ExpenseForm(
            index: index,
            expense: expense,
          );
        } else {
          return ExpenseForm(); // Handle error case or fallback
        }
      },
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<AuthBloc>()),
        BlocProvider(create: (_) => di.locator<CurrencyCubit>()),
        BlocProvider(create: (_) => di.locator<CategoryCubit>()),
        BlocProvider(create: (_) => di.locator<ExpenseBloc>()),
        BlocProvider(
            create: (_) => di.locator<AuthBloc>()..add(CheckAuthEvent())),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routerConfig: _router,
          locale: const Locale('en', ''),
          // Set Arabic as the default language

          key: ValueKey('ar'),
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('ar', ''), // Arabic
          ],
          theme: ThemeDataProvider.lightTheme(context),
          localizationsDelegates: const [
            S.delegate, // Generated delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
        );
      }),
    );
  }
}
