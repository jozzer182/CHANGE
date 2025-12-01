import 'dart:convert';

import 'package:chango/changeorder/model/changeorder_model.dart';
import 'package:http/http.dart';

import '../../resources/env_config.dart';

class ChangeOrderList {
  List<ChangeOrder> lista = [];
  List<ChangeOrder> listaSearch = [];

  Map itemsAndFlex = {
    'id': [1, 'id'],
    'usuario': [2, 'Usuario'],
    'suppliername': [4, 'contrato'],
    'extensionofamount': [2, 'por Monto'],
    'extensionofduration': [2, 'por Duración'],
    'fecharegistro': [1, 'Fecha'],
  };
  get keys {
    return itemsAndFlex.keys.toList();
  }

  get listaTitulo {
    // print('listaTitulo');
    return [
      for (var key in keys)
        {'texto': itemsAndFlex[key][1], 'flex': itemsAndFlex[key][0]},
    ];
  }

  Future obtener() async {
    // print('obtener');
    lista.clear();
    listaSearch.clear();
    Map<String, Object> dataSend = {
      "info": {"libro": "DB", "hoja": "registros"},
      "fname": "getHoja"
    };
    // print(jsonEncode(dataSend));
    Response response = await post(
      EnvConfig.apiMainUri,
      body: jsonEncode(dataSend),
    );
    List dataAsListMap;
    if (response.statusCode == 302) {
      Response response2 =
          await get(Uri.parse(response.headers["location"] ?? ''));
      dataAsListMap = jsonDecode(response2.body);
    } else {
      dataAsListMap = jsonDecode(response.body);
    }
    for (var item in dataAsListMap) {
      lista.add(ChangeOrder.fromMap(item));
    }
    // lista.sort((a, b) => b.pedido.compareTo(a.pedido));
    lista = lista.reversed.toList();
    listaSearch = [...lista];
  }

  void buscar(String busqueda) {
    // print('buscar');
    listaSearch = lista.where((element) {
      return element.toMap().values.any((item) {
        return item.toLowerCase().contains(busqueda.toLowerCase());
      });
    }).toList();
    // print('listaSearch: $listaSearch');
  }
}
