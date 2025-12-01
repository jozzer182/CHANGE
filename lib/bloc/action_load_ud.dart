import 'package:async/async.dart';
import 'package:chango/bloc/main_bloc.dart';
import 'package:chango/eurcop/controller/eurcop_action.dart';
import 'package:chango/usdcop/controller/usdcop_action.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../changeorder/controller/changeorder_action.dart';
import '../gm/controller/gm_action.dart';
import '../user/controller/user_action.dart';

Future onLoadUserData(Load event, emit, MainState Function() state) async {
  emit(state().copyWith(isLoading: true));
  // print(FirebaseAuth.instance.currentUser?.email);

  if (FirebaseAuth.instance.currentUser?.email != null &&
      state().users != null) {
    await onCreateUser(event, emit, state);
    if (state().user != null) {
      FutureGroup futureGroup = FutureGroup();
      futureGroup.add(onLoadChangeOrderList(event, emit, state));
      futureGroup.add(onLoadGmList(event, emit, state));
      futureGroup.add(onLoadEurcop(event, emit, state));
      futureGroup.add(onLoadUsdcop(event, emit, state));
      // futureGroup.add(onLoadRegistros(event, emit, state));
      // futureGroup.add(onLoadIngresos(event, emit, state));
      // futureGroup.add(onLoadLcl(event, emit, state));
      // futureGroup.add(onLoadPap(event, emit, state));
      futureGroup.close();
      try {
        await futureGroup.future;
        //     .whenComplete(() => onCalculateData(event, emit, state));
      } on Exception catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }
  // print('state().users.usersList: ${state().users!.usersList}');
  emit(state().copyWith(isLoading: false));
}
