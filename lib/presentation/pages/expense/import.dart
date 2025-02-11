import 'package:app_tracker/presentation/bloc/expense/expense_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/entities/expense_entity.dart';
import '../../../generated/l10n.dart';
import '../../bloc/cubit/category_cupit.dart';
import '../../bloc/cubit/currency_cupit.dart';
import '../../bloc/expense/expense_event.dart';
import '../../bloc/expense/expense_state.dart';
import '../../common_widget/import.dart';
import '../analysis/import.dart';
import 'expense_data.dart';

part '../expense/expense_form.dart';