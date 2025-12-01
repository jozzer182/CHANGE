// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';

import '../../resources/env_config.dart';

class Gm {
  List<GmSingle> lista = [];
  List<GmSingle> listaSearch = [];

  Map itemsAndFlex = {
    'codigo': [2, 'Código'],
    'descripcion': [6, 'Descripción'],
    'riskhs': [2, 'Risk HS'],
    'ambito': [5, 'ámbito'],
    'familia': [6, 'Familia'],
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
    lista.clear();
    listaSearch.clear();
    Map<String, Object> dataSend = {
      "info": {"libro": "GM", "hoja": "GM"},
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
      lista.add(GmSingle.fromMap(item));
    }
    // lista.sort((a, b) => b.pedido.compareTo(a.pedido));
    lista = lista.reversed.toList();
    listaSearch = [...lista];
  }

  void buscar(String busqueda) {
    listaSearch = lista.where((element) {
      return element.codigo.toLowerCase().contains(busqueda.toLowerCase()) ||
          element.descripcion.toLowerCase().contains(busqueda.toLowerCase());
    }).toList();
  }
}

class GmSingle {
  String ambitocode;
  String ambito;
  String familiacode;
  String familia;
  String clasecode;
  String codigo;
  String descripcion;
  String rutadecualificacion;
  String risktec;
  String riskamb;
  String riskhs;
  String riskrep;
  String perimetrocalificacion;
  String tiposuministro;
  String mgdelegated;
  String anunciosdeguialicitacion;
  String tenderperimeter;
  String strategicmg;
  GmSingle({
    required this.ambitocode,
    required this.ambito,
    required this.familiacode,
    required this.familia,
    required this.clasecode,
    required this.codigo,
    required this.descripcion,
    required this.rutadecualificacion,
    required this.risktec,
    required this.riskamb,
    required this.riskhs,
    required this.riskrep,
    required this.perimetrocalificacion,
    required this.tiposuministro,
    required this.mgdelegated,
    required this.anunciosdeguialicitacion,
    required this.tenderperimeter,
    required this.strategicmg,
  });

  GmSingle copyWith({
    String? ambitocode,
    String? ambito,
    String? familiacode,
    String? familia,
    String? clasecode,
    String? codigo,
    String? descripcion,
    String? rutadecualificacion,
    String? risktec,
    String? riskamb,
    String? riskhs,
    String? riskrep,
    String? perimetrocalificacion,
    String? tiposuministro,
    String? mgdelegated,
    String? anunciosdeguialicitacion,
    String? tenderperimeter,
    String? strategicmg,
  }) {
    return GmSingle(
      ambitocode: ambitocode ?? this.ambitocode,
      ambito: ambito ?? this.ambito,
      familiacode: familiacode ?? this.familiacode,
      familia: familia ?? this.familia,
      clasecode: clasecode ?? this.clasecode,
      codigo: codigo ?? this.codigo,
      descripcion: descripcion ?? this.descripcion,
      rutadecualificacion: rutadecualificacion ?? this.rutadecualificacion,
      risktec: risktec ?? this.risktec,
      riskamb: riskamb ?? this.riskamb,
      riskhs: riskhs ?? this.riskhs,
      riskrep: riskrep ?? this.riskrep,
      perimetrocalificacion: perimetrocalificacion ?? this.perimetrocalificacion,
      tiposuministro: tiposuministro ?? this.tiposuministro,
      mgdelegated: mgdelegated ?? this.mgdelegated,
      anunciosdeguialicitacion: anunciosdeguialicitacion ?? this.anunciosdeguialicitacion,
      tenderperimeter: tenderperimeter ?? this.tenderperimeter,
      strategicmg: strategicmg ?? this.strategicmg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ambitocode': ambitocode,
      'ambito': ambito,
      'familiacode': familiacode,
      'familia': familia,
      'clasecode': clasecode,
      'codigo': codigo,
      'descripcion': descripcion,
      'rutadecualificacion': rutadecualificacion,
      'risktec': risktec,
      'riskamb': riskamb,
      'riskhs': riskhs,
      'riskrep': riskrep,
      'perimetrocalificacion': perimetrocalificacion,
      'tiposuministro': tiposuministro,
      'mgdelegated': mgdelegated,
      'anunciosdeguialicitacion': anunciosdeguialicitacion,
      'tenderperimeter': tenderperimeter,
      'strategicmg': strategicmg,
    };
  }

  factory GmSingle.fromMap(Map<String, dynamic> map) {
    return GmSingle(
      ambitocode: map['ambitocode'].toString(),
      ambito: map['ambito'].toString(),
      familiacode: map['familiacode'].toString(),
      familia: map['familia'].toString(),
      clasecode: map['clasecode'].toString(),
      codigo: map['codigo'].toString(),
      descripcion: map['descripcion'].toString(),
      rutadecualificacion: map['rutadecualificacion'].toString(),
      risktec: map['risktec'].toString(),
      riskamb: map['riskamb'].toString(),
      riskhs: map['riskhs'].toString(),
      riskrep: map['riskrep'].toString(),
      perimetrocalificacion: map['perimetrocalificacion'].toString(),
      tiposuministro: map['tiposuministro'].toString(),
      mgdelegated: map['mgdelegated'].toString(),
      anunciosdeguialicitacion: map['anunciosdeguialicitacion'].toString(),
      tenderperimeter: map['tenderperimeter'].toString(),
      strategicmg: map['strategicmg'].toString(),
    );
  }

  factory GmSingle.fromZero() {
    return GmSingle(
      ambitocode: '',
      ambito: '',
      familiacode: '',
      familia: '',
      clasecode: '',
      codigo: '',
      descripcion: '',
      rutadecualificacion: '',
      risktec: '',
      riskamb: '',
      riskhs: '',
      riskrep: '',
      perimetrocalificacion: '',
      tiposuministro: '',
      mgdelegated: '',
      anunciosdeguialicitacion: '',
      tenderperimeter: '',
      strategicmg: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GmSingle.fromJson(String source) => GmSingle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GmSingle(ambitocode: $ambitocode, ambito: $ambito, familiacode: $familiacode, familia: $familia, clasecode: $clasecode, codigo: $codigo, descripcion: $descripcion, rutadecualificacion: $rutadecualificacion, risktec: $risktec, riskamb: $riskamb, riskhs: $riskhs, riskrep: $riskrep, perimetrocalificacion: $perimetrocalificacion, tiposuministro: $tiposuministro, mgdelegated: $mgdelegated, anunciosdeguialicitacion: $anunciosdeguialicitacion, tenderperimeter: $tenderperimeter, strategicmg: $strategicmg)';
  }

  @override
  bool operator ==(covariant GmSingle other) {
    if (identical(this, other)) return true;
  
    return 
      other.ambitocode == ambitocode &&
      other.ambito == ambito &&
      other.familiacode == familiacode &&
      other.familia == familia &&
      other.clasecode == clasecode &&
      other.codigo == codigo &&
      other.descripcion == descripcion &&
      other.rutadecualificacion == rutadecualificacion &&
      other.risktec == risktec &&
      other.riskamb == riskamb &&
      other.riskhs == riskhs &&
      other.riskrep == riskrep &&
      other.perimetrocalificacion == perimetrocalificacion &&
      other.tiposuministro == tiposuministro &&
      other.mgdelegated == mgdelegated &&
      other.anunciosdeguialicitacion == anunciosdeguialicitacion &&
      other.tenderperimeter == tenderperimeter &&
      other.strategicmg == strategicmg;
  }

  @override
  int get hashCode {
    return ambitocode.hashCode ^
      ambito.hashCode ^
      familiacode.hashCode ^
      familia.hashCode ^
      clasecode.hashCode ^
      codigo.hashCode ^
      descripcion.hashCode ^
      rutadecualificacion.hashCode ^
      risktec.hashCode ^
      riskamb.hashCode ^
      riskhs.hashCode ^
      riskrep.hashCode ^
      perimetrocalificacion.hashCode ^
      tiposuministro.hashCode ^
      mgdelegated.hashCode ^
      anunciosdeguialicitacion.hashCode ^
      tenderperimeter.hashCode ^
      strategicmg.hashCode;
  }
}
