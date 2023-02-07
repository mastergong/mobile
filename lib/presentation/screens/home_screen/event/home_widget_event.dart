import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/bloc/tab_select/tab_select_bloc.dart';

void onBottomTab({required BuildContext context, required int index}) {
  context.read<TabSelectBloc>().add(SelectEven(index));
}
