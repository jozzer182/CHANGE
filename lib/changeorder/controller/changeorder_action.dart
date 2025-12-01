import 'package:chango/changeorder/model/changeorderlist_model.dart';
import '../../bloc/main_bloc.dart';

Future onLoadChangeOrderList(event, emit, MainState Function() state) async {
  ChangeOrderList changeOrderList = ChangeOrderList();
  try {
    // print('onLoadLm');
    await changeOrderList.obtener();
    emit(state().copyWith(changeOrderList: changeOrderList));
    // print('users: ${state().users?.usersList}');
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error llamando📞 la tabla de Change Orders ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
}

onBusquedaChangeOrderList(
  BusquedaChangeOrderList event,
  emit,
  MainState Function() state,
) {
  state().changeOrderList?.buscar(event.busqueda);
  emit(state().copyWith());
}

onSetChangeOrder(
  SetChangeOrder event,
  emit,
  MainState Function() state,
) {
  state().changeOrder = event.changeOrder;
  emit(state().copyWith());
}

onChangeOrderField(
  ChangeOrderField event,
  emit,
  MainState Function() state,
) {
  state().changeOrder?.asignar(
        campo: event.campo,
        valor: event.valor,
        gm: state().gm!,
      );
  emit(state().copyWith());
}

onValidateChangeOrder(
  ValidateChangeOrder event,
  emit,
  MainState Function() state,
) {
  if (state().changeOrder?.validar != null) {
    emit(state().copyWith(
      dialogCounter: state().dialogCounter + 1,
      dialogMessage: state().changeOrder?.validar?.join('\n'),
    ));
  } 
}

onAddToDbChangeOrder(
  AddToDbChangeOrder event,
  emit,
  MainState Function() state,
  add,
) async {
  emit(state().copyWith(isLoading: true));

  if (state().changeOrder?.validar != null) {
    emit(state().copyWith(
      dialogCounter: state().dialogCounter + 1,
      dialogMessage: state().changeOrder?.validar?.join('\n'),
    ));
  } else {
    // ignore: unused_local_variable
    String? respuesta;
    try {
      respuesta = await state().changeOrder?.addToDb(user: state().user!);
      // Navigator.pop(event.context);
      add(Load());
    } catch (e) {
      emit(state().copyWith(
        errorCounter: state().errorCounter + 1,
        message:
            '🤕Error enviando los datos del change Order: ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
      ));
    }
    emit(state().copyWith(
      dialogCounter: state().dialogCounter + 1,
      dialogMessage: respuesta ?? 'Error en el envío',
    ));
  }

  emit(state().copyWith(isLoading: false));
}

onUpdateToDbChangeOrder(
  UpdateToDbChangeOrder event,
  emit,
  MainState Function() state,
  add,
) async {
  emit(state().copyWith(isLoading: true));

  if (state().changeOrder?.validar != null) {
    emit(state().copyWith(
      dialogCounter: state().dialogCounter + 1,
      dialogMessage: state().changeOrder?.validar?.join('\n'),
    ));
  } else {
    // ignore: unused_local_variable
    String? respuesta;
    try {
      respuesta = await state().changeOrder?.updateToDb(user: state().user!);
      // Navigator.pop(event.context);
      add(Load());
    } catch (e) {
      emit(state().copyWith(
        errorCounter: state().errorCounter + 1,
        message:
            '🤕Error enviando los datos del change Order: ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
      ));
    }
    emit(state().copyWith(
      dialogCounter: state().dialogCounter + 1,
      dialogMessage: respuesta ?? 'Error en el envío',
    ));
  }

  emit(state().copyWith(isLoading: false));
}
