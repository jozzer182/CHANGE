// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:chango/changeorder/model/changeorder_model.dart';
import 'package:chango/eurcop/model/eurcop_model.dart';
import 'package:chango/gm/model/gm_model.dart';
import 'package:chango/usdcop/model/usdcop.dart';
import 'package:chango/users/model/users_model.dart';
import 'package:flutter/material.dart';

import '../changeorder/controller/changeorder_action.dart';
import '../changeorder/model/changeorder_enum.dart';
import '../changeorder/model/changeorderlist_model.dart';
import '../gm/controller/gm_action.dart';
import '../user/model/user_model.dart';
import '../users/model/perfiles_model.dart';
import 'action_color.dart';
import 'action_load_data.dart';
import 'action_load_test.dart';

part 'main_event.dart';
part 'main_state.dart';
part '../changeorder/controller/changeorder_events.dart';
part '../gm/controller/gm_events.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    // on<Load>(onLoad);
    on<Load>((ev, em) => onLoadData(ev, em, supraState));
    on<LoadTest>((ev, em) => onLoadTest(ev, em, supraState));
    on<NewMessage>(onNewMessage);
    on<Loading>(onLoading);
    on<ThemeChange>((ev, em) => onThemeChange(ev, em, supraState));
    on<ThemeColorChange>((ev, em) => onThemeColorChange(ev, em, supraState));
    on<BusquedaChangeOrderList>(
        (ev, em) => onBusquedaChangeOrderList(ev, em, supraState));
    on<SetChangeOrder>((ev, em) => onSetChangeOrder(ev, em, supraState));
    on<ChangeOrderField>((ev, em) => onChangeOrderField(ev, em, supraState));
    on<AddToDbChangeOrder>((ev,em)=>onAddToDbChangeOrder(ev,em,supraState,add));
    on<UpdateToDbChangeOrder>((ev,em)=>onUpdateToDbChangeOrder(ev,em,supraState,add));
    on<BusquedaGmList>((ev,em)=>onBusquedaGmList(ev,em,supraState));
    on<ValidateChangeOrder>((ev,em)=>onValidateChangeOrder(ev,em,supraState));
  }
  MainState supraState() => state;

  //Ui status on BLOC

  onNewMessage(NewMessage event, emit) {
    emit(
      state.copyWith(
        message: event.message,
        messageCounter: event.typeMessage == TypeMessage.error
            ? 0
            : state.messageCounter + 1,
        errorCounter:
            event.typeMessage == TypeMessage.error ? state.errorCounter + 1 : 0,
        messageColor: event.color,
      ),
    );
  }

  onLoading(Loading event, emit) {
    emit(state.copyWith(
      isLoading: event.isLoading,
    ));
  }

  //------------------Especific Events ------------------

  onListLoadMore(event, emit) {
    emit(state.copyWith());
    //  print('state.plataforma!.view ${state.plataforma!.view}');
    switch (event.table) {
      case 'registros':
        // state.registros!.viewRegistros = state.registros!.viewRegistros + 10;
        break;
      default:
    }
    emit(state.copyWith());
    // print('state.plataforma!.view ${state.plataforma!.view}');
  }
}
