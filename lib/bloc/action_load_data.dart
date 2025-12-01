import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:async/async.dart';
import '../changeorder/model/changeorder_model.dart';
import '../users/controller/users_action.dart';
import 'action_color.dart';
import 'action_load_ud.dart';
import 'main_bloc.dart';

onLoadData(
  Load event,
  Emitter<MainState> emit,
  MainState Function() state,
) async {
  state().initial();
  emit(state().copyWith(isLoading: true));
  FutureGroup futureGroup0 = FutureGroup();
  futureGroup0.add(onLoadPerfiles(event, emit, state));
  futureGroup0.add(onLoadUsers(event, emit, state));
  futureGroup0.close();
  FutureGroup futureGroup = FutureGroup();
  futureGroup.add(futureGroup0.future
      .whenComplete(() async => await onLoadUserData(event, emit, state)));

  futureGroup.add(themeLoader(event, emit, state));
  futureGroup.add(themeColorLoader(event, emit, state));
  futureGroup.close();
  state().changeOrder = ChangeOrder.fromInit();
  try {
    await futureGroup.future
        .whenComplete(() => emit(state().copyWith(isLoading: false)));
  } on Exception catch (e) {
    emit(state().copyWith(
      message: 'error cargando datos => $e',
      errorCounter: state().errorCounter + 1,
      messageColor: Colors.red,
    ));
  }
  // // esperar 3 segundos
  // await Future.delayed(const Duration(seconds: 3));
  // emit(state().copyWith(
  //   message: 'prueba de mensaje de error',
  //   errorCounter: state().errorCounter + 1,
  //   messageColor: Colors.red,
  // ));
  // await Future.delayed(const Duration(seconds: 3));

  // emit(state().copyWith(
  //   dialogCounter: state().dialogCounter + 1,
  //   dialogMessage: 'prueba de mensaje de dialogo',	
  // ));

  // print('state().users.usersList: ${state().users!.usersList}');
  // emit(state().copyWith(isLoading: false));
}

// onLoadPeople(event, emit, MainState Function() state) async {
//   PeopleB peopleB = PeopleB();
//   try {
//     await peopleB.obtener();
//     emit(state().copyWith(peopleB: peopleB));
//   } catch (e) {
//     emit(state().copyWith(
//       errorCounter: state().errorCounter + 1,
//       message:
//           '🤕Error llamando📞 la tabla de datos People ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
//     ));
//   }
// }
