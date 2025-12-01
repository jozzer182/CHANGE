import 'package:chango/usdcop/model/usdcop.dart';

import '../../bloc/main_bloc.dart';

Future onLoadUsdcop(event, emit, MainState Function() state) async {
  Usdcop usdcop = Usdcop();
  try {
    // print('onLoadLm');
    await usdcop.obtener();
    emit(state().copyWith(usdcop: usdcop));
    // print('onLoadusdcop usdcop: ${state().usdcop?.close}');
  } catch (e) {
    emit(state().copyWith(
      errorCounter: state().errorCounter + 1,
      message:
          '🤕Error llamando📞 la tabla de USDCOP ⚠️$e => ${e.runtimeType}, intente recargar la página🔄, total errores: ${state().errorCounter + 1}',
    ));
  }
}