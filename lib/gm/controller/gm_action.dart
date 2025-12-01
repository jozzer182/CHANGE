

import 'package:chango/gm/model/gm_model.dart';

import '../../bloc/main_bloc.dart';

Future onLoadGmList(event, emit, MainState Function() state) async {
  Gm gm = Gm();
  try {
    // print('onLoadLm');
    await gm.obtener();
    emit(state().copyWith(gm: gm));
    // print('gm: ${state().gm?.lista}');
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error llamando📞 la tabla de Gm ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
}


onBusquedaGmList(
  BusquedaGmList event,
  emit,
  MainState Function() state,
) {
  state().gm?.buscar(event.busqueda);
  emit(state().copyWith());
}