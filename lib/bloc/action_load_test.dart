import 'package:chango/changeorder/model/changeorder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:async/async.dart';
import '../changeorder/controller/changeorder_action.dart';
import 'action_color.dart';
import 'main_bloc.dart';

onLoadTest(
  LoadTest event,
  Emitter<MainState> emit,
  MainState Function() state,
) async {
  state().initial();
  emit(state().copyWith(isLoading: true));
  FutureGroup futureGroup = FutureGroup();
  futureGroup.add(themeLoader(event, emit, state));
  futureGroup.add(themeColorLoader(event, emit, state));
  futureGroup.add(onLoadChangeOrderList(event, emit, state));
  futureGroup.close();
  try {
    await futureGroup.future;
    state().changeOrder = ChangeOrder.fromInit();
  } on Exception catch (e) {
    emit(state().copyWith(
      message: 'error cargando datos => $e',
      errorCounter: state().errorCounter + 1,
      messageColor: Colors.red,
    ));
  }
  //esperar 3 segundos
  // await Future.delayed(const Duration(seconds: 3));
  // print('state().users.usersList: ${state().users!.usersList}');
  emit(state().copyWith(isLoading: false));
}
