import 'package:app_tracker/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_tracker/presentation/bloc/cubit/category_cupit.dart';
import 'package:app_tracker/presentation/bloc/cubit/currency_cupit.dart';
import 'package:app_tracker/presentation/bloc/expense/expense_bloc.dart';
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
import 'generated/l10n.dart';
import '././injection.dart' as di;

final _router = GoRouter(
  initialLocation: "/splash",
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthInitial) {
      return state.fullPath == "/splash" ? null : "/splash";
    } else if (authState is AuthSuccess) {
      return state.fullPath == "/expenseform" ? null : "/home";
    } else if (authState is AuthFailure) {
      return state.fullPath == "/login" ? null : "/login";
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
      path: '/expenseform',
      builder: (BuildContext context, GoRouterState state) {
        if (state.extra == null) {
          return ExpenseForm();
        }
        final Map<String, dynamic>? args = state.extra as Map<String, dynamic>;
        final index = args!['index'];
        final expense = args!['expense'];

        return ExpenseForm(
          index: index,
          expense: expense,
        );
      },
    ),
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
