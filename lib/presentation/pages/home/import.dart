
import 'package:app_tracker/core/utils/constants.dart';
import 'package:app_tracker/core/utils/themedata.dart';
import 'package:app_tracker/presentation/bloc/cubit/category_cupit.dart';
import 'package:app_tracker/presentation/common_widget/import.dart';
import 'package:app_tracker/presentation/pages/expense/expense_data.dart';
import 'package:app_tracker/presentation/pages/expense/widget/import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/expense_entity.dart';
import '../../../generated/l10n.dart';
import '../../bloc/cubit/currency_cupit.dart';
import '../../bloc/expense/expense_bloc.dart';
import '../../bloc/expense/expense_event.dart';
import '../../bloc/expense/expense_state.dart';
import '../expense/import.dart';
part 'home_page.dart';
