// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:chango/changeorder/model/changeorder_enum.dart';
import 'package:chango/resources/a_entero.dart';
import 'package:chango/resources/env_config.dart';
import 'package:chango/user/model/user_model.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../gm/model/gm_model.dart';

class ChangeOrder {
  String id;
  String responsabilityarea;
  String requesttype;
  String idelectronicsignaturetool;
  String localidcode;
  String date;
  String local;
  String area;
  String country;
  String region;
  String unit;
  String contractcode;
  String contracawardedbydirectawarding;
  String suppliercode;
  String suppliername;
  String mg;
  String mgdescription;
  String objectofthecontract;
  String contractstartdate;
  String contractenddate;
  String totalmonths;
  String amountofthecontract;
  String amountofthecontracteuro;
  String residualamount;
  String residualamounteuro;
  String optionandtolerancealreadyactivated;
  String newcontractalreadyplanned;
  String purchasedrequestcode;
  String smartplanningtoolrequirementid;
  String prrelasedate;
  String contractavailabilitydate;
  String contractorsetupfortcaperiod;
  String notetonextcontractstatus;
  String numberofchangeorderformerlyapproved;
  String lastcaformerlyapproveddate;
  String reasonclassification;
  String changeordercategory;
  String changeorderlevel;
  String finalauthorizer;
  String reason;
  String extensionofamount;
  String currentcurrencyexchangevalue;
  String amountoftheoriginalcontract;
  String amountoftheoriginalcontracteuro;
  String amountofextensionsformerlyapproved;
  String amountofextensionsformerlyapprovedeuro;
  String amountofextensionunderapprova;
  String amountofextensionunderapprovaeuro;
  String changeorderamount;
  String changeorderamounteuro;
  String percentageincrease;
  String extensionofduration;
  String durationoftheoriginalcontract;
  String durationofextensionsapprovedformerly;
  String durationofextensionunderapproval;
  String changeorderduration;
  String supplierqualifiedformgofthecontract;
  String mghighmediumriskpresentinthecontract;
  String positiveevaluationhseq;
  String note;
  String unit1;
  String namesurname1;
  String unit2;
  String namesurname2;
  String unit3;
  String namesurname3;
  String unitglobalsccm;
  String headofglobalscwscm;
  String headofsccm;
  String headofglobalsccm;
  String headofglobalomec;
  String headofglobalin;
  String headforelevantglobalfunctions;
  String globalunitglobalsccm;
  String globalheadofsccm;
  String globalheadofglobalsccm;
  String globalheadofglobalomec;
  String globalheadofglobalin;
  String estado;
  String usuario;
  String usuariocorreo;
  String comentario;
  String fecharegistro;
  String historialestados;
  String trmfecha;
  String trmfuente;
  String trm;
  String amountofthecontractdollar;
  String residualamountdollar;
  String amountoftheoriginalcontractdollar;
  String amountofextensionsformerlyapproveddollar;
  String amountofextensionunderapprovadollar;
  ChangeOrder({
    required this.id,
    required this.responsabilityarea,
    required this.requesttype,
    required this.idelectronicsignaturetool,
    required this.localidcode,
    required this.date,
    required this.local,
    required this.area,
    required this.country,
    required this.region,
    required this.unit,
    required this.contractcode,
    required this.contracawardedbydirectawarding,
    required this.suppliercode,
    required this.suppliername,
    required this.mg,
    required this.mgdescription,
    required this.objectofthecontract,
    required this.contractstartdate,
    required this.contractenddate,
    required this.totalmonths,
    required this.amountofthecontract,
    required this.amountofthecontracteuro,
    required this.residualamount,
    required this.residualamounteuro,
    required this.optionandtolerancealreadyactivated,
    required this.newcontractalreadyplanned,
    required this.purchasedrequestcode,
    required this.smartplanningtoolrequirementid,
    required this.prrelasedate,
    required this.contractavailabilitydate,
    required this.contractorsetupfortcaperiod,
    required this.notetonextcontractstatus,
    required this.numberofchangeorderformerlyapproved,
    required this.lastcaformerlyapproveddate,
    required this.reasonclassification,
    required this.changeordercategory,
    required this.changeorderlevel,
    required this.finalauthorizer,
    required this.reason,
    required this.extensionofamount,
    required this.currentcurrencyexchangevalue,
    required this.amountoftheoriginalcontract,
    required this.amountoftheoriginalcontracteuro,
    required this.amountofextensionsformerlyapproved,
    required this.amountofextensionsformerlyapprovedeuro,
    required this.amountofextensionunderapprova,
    required this.amountofextensionunderapprovaeuro,
    required this.changeorderamount,
    required this.changeorderamounteuro,
    required this.percentageincrease,
    required this.extensionofduration,
    required this.durationoftheoriginalcontract,
    required this.durationofextensionsapprovedformerly,
    required this.durationofextensionunderapproval,
    required this.changeorderduration,
    required this.supplierqualifiedformgofthecontract,
    required this.mghighmediumriskpresentinthecontract,
    required this.positiveevaluationhseq,
    required this.note,
    required this.unit1,
    required this.namesurname1,
    required this.unit2,
    required this.namesurname2,
    required this.unit3,
    required this.namesurname3,
    required this.unitglobalsccm,
    required this.headofglobalscwscm,
    required this.headofsccm,
    required this.headofglobalsccm,
    required this.headofglobalomec,
    required this.headofglobalin,
    required this.headforelevantglobalfunctions,
    required this.globalunitglobalsccm,
    required this.globalheadofsccm,
    required this.globalheadofglobalsccm,
    required this.globalheadofglobalomec,
    required this.globalheadofglobalin,
    required this.estado,
    required this.usuario,
    required this.usuariocorreo,
    required this.comentario,
    required this.fecharegistro,
    required this.historialestados,
    required this.trmfecha,
    required this.trmfuente,
    required this.trm,
    required this.amountofthecontractdollar,
    required this.residualamountdollar,
    required this.amountoftheoriginalcontractdollar,
    required this.amountofextensionsformerlyapproveddollar,
    required this.amountofextensionunderapprovadollar,
  });

  Future<String> get lastNumberReg async {
    // print('lastNumberReg Called');
    Map dataSend = {
      'info': {'libro': 'DB', 'hoja': 'registros'},
      'fname': "lastNumberReg"
    };
    // print(jsonEncode(dataSend));
    Response response = await post(
        EnvConfig.apiMainUri,
        body: jsonEncode(dataSend));
    // print(response.body);
    String respuesta = jsonDecode(response.body) ?? 'error';
    // localidcode = respuesta;
    return respuesta;
  }

  List? get validar {
    var faltantes = [];
    // Color color = Colors.red;
    if (requesttype == '') {
      faltantes.add('requesttype');
    }
    if (contractstartdate == '') {
      faltantes.add('fecha de inicio de contrato');
    }
    if (contractenddate == '') {
      faltantes.add('fecha de fin de contrato');
    }
    if (totalmonths == '') {
      faltantes.add('Coherencia de las fechas de inicio y fin de contrato');
    }
    //agregar mas cmapos a comprobar
    if (faltantes.isNotEmpty) {
      faltantes.insert(0,
          'Por favor revise los siguientes campos para poder realizar el guardado:');
      return faltantes;
    } else {
      return null;
    }
  }

  Future<String?> addToDb({
    required User user,
  }) async {
    usuario = user.nombre;
    usuariocorreo = user.correo;
    fecharegistro = DateTime.now().toString().substring(0, 10);
    List estados = [];
    estados.add({
      'estado': estado,
      'usuario': usuario,
      'usuariocorreo': usuariocorreo,
      'comentario': comentario,
      'fecharegistro': fecharegistro,
    });
    historialestados = json.encode(estados).toString();
    // print(historialestados);

    Map dataSend = {
      'info': {'libro': 'DB', 'map': toMap(), 'hoja': 'registros'},
      'fname': "addMap"
    };
    Response response = await post(
      EnvConfig.apiMainUri,
      body: jsonEncode(dataSend),
    );
    // List dataAsListMap;
    var respuesta = jsonDecode(response.body) ?? 'error en el envio';
    return respuesta;
  }

  Future<String?> updateToDb({
    required User user,
  }) async {
    usuario = user.nombre;
    usuariocorreo = user.correo;
    fecharegistro = DateTime.now().toString().substring(0, 10);
    List estados = json.decode(historialestados);
    estados.add({
      'estado': estado,
      'usuario': usuario,
      'usuariocorreo': usuariocorreo,
      'comentario': comentario,
      'fecharegistro': fecharegistro,
    });
    historialestados = json.encode(estados);
    // print(historialestados);
    Map dataSend = {
      'info': {'libro': 'DB', 'map': toMap(), 'hoja': 'registros'},
      'fname': "updateMap"
    };
    Response response = await post(
      EnvConfig.apiMainUri,
      body: jsonEncode(dataSend),
    );
    // List dataAsListMap;
    var respuesta = jsonDecode(response.body) ?? 'error en el envio';
    return respuesta;
  }

  void asignar({
    required CampoChangeOrder campo,
    required String valor,
    required Gm gm,
  }) {
    if (campo == CampoChangeOrder.responsabilityarea) {
      responsabilityarea = valor;
      bool esOM = responsabilityarea.toLowerCase().contains('operation');
      if (esOM) {
        area = 'Supply Chain';
      } else {
        area = 'E&C Contract Management';
      }
      setLevel();
      setCategory();
    }
    if (campo == CampoChangeOrder.requesttype) {
      requesttype = valor;
    }
    if (campo == CampoChangeOrder.idelectronicsignaturetool) {
      idelectronicsignaturetool = valor;
    }
    if (campo == CampoChangeOrder.localidcode) {
      localidcode = valor;
    }
    if (campo == CampoChangeOrder.date) {
      date = valor;
    }
    if (campo == CampoChangeOrder.local) {
      local = valor;
    }
    if (campo == CampoChangeOrder.area) {
      area = valor;
    }
    if (campo == CampoChangeOrder.country) {
      country = valor;
    }
    if (campo == CampoChangeOrder.region) {
      region = valor;
    }
    if (campo == CampoChangeOrder.unit) {
      unit = valor;
    }
    if (campo == CampoChangeOrder.contractcode) {
      contractcode = valor;
    }
    if (campo == CampoChangeOrder.contracawardedbydirectawarding) {
      contracawardedbydirectawarding = valor;
    }
    if (campo == CampoChangeOrder.suppliercode) {
      suppliercode = valor;
    }
    if (campo == CampoChangeOrder.suppliername) {
      suppliername = valor;
    }
    if (campo == CampoChangeOrder.mg) {
      mg = valor;
      mgdescription = gm.lista
          .firstWhere(
            (e) => e.codigo.toLowerCase().contains(valor.toLowerCase()),
            orElse: () => GmSingle.fromZero(),
          )
          .descripcion;
    }
    if (campo == CampoChangeOrder.mgdescription) {
      mgdescription = valor;
    }
    if (campo == CampoChangeOrder.objectofthecontract) {
      objectofthecontract = valor;
    }
    if (campo == CampoChangeOrder.contractstartdate) {
      contractstartdate = valor;
      if (contractenddate.isNotEmpty) {
        if (DateTime.parse(contractstartdate)
            .isAfter(DateTime.parse(contractenddate))) {
          totalmonths = '';
        } else {
          setTotalMonths();
        }
        // setTotalMonths();
      }
      // setTotalMonths();
    }
    if (campo == CampoChangeOrder.contractenddate) {
      contractenddate = valor;
      if (contractenddate.isNotEmpty) {
        if (DateTime.parse(contractstartdate)
            .isAfter(DateTime.parse(contractenddate))) {
          totalmonths = '';
        } else {
          setTotalMonths();
        }
        // setTotalMonths();
      }
    }
    if (campo == CampoChangeOrder.totalmonths) {
      totalmonths = valor;
    }
    if (campo == CampoChangeOrder.amountofthecontract) {
      amountofthecontract = valor;
      if (valor.isNotEmpty) {
        amountofthecontracteuro = (aEntero(amountofthecontract) /
                aEntero(currentcurrencyexchangevalue))
            .floor()
            .toString();
      } else {
        amountofthecontracteuro = '';
      }
    }
    if (campo == CampoChangeOrder.amountofthecontracteuro) {
      amountofthecontracteuro = valor;
      if (valor.isNotEmpty) {
        amountofthecontract = (aEntero(amountofthecontracteuro) *
                aEntero(currentcurrencyexchangevalue))
            .toString();
      } else {
        amountofthecontract = '';
      }
    }
    if (campo == CampoChangeOrder.residualamount) {
      residualamount = valor;
      if (valor.isNotEmpty) {
        residualamounteuro =
            (aEntero(residualamount) / aEntero(currentcurrencyexchangevalue))
                .floor()
                .toString();
      } else {
        residualamounteuro = '';
      }
    }
    if (campo == CampoChangeOrder.residualamounteuro) {
      residualamounteuro = valor;
      if (valor.isNotEmpty) {
        residualamount = (aEntero(residualamounteuro) *
                aEntero(currentcurrencyexchangevalue))
            .toString();
      } else {
        residualamount = '';
      }
    }
    if (campo == CampoChangeOrder.optionandtolerancealreadyactivated) {
      optionandtolerancealreadyactivated = valor;
    }
    if (campo == CampoChangeOrder.newcontractalreadyplanned) {
      newcontractalreadyplanned = valor;
    }
    if (campo == CampoChangeOrder.purchasedrequestcode) {
      purchasedrequestcode = valor;
    }
    if (campo == CampoChangeOrder.smartplanningtoolrequirementid) {
      smartplanningtoolrequirementid = valor;
    }
    if (campo == CampoChangeOrder.prrelasedate) {
      prrelasedate = valor;
    }
    if (campo == CampoChangeOrder.contractavailabilitydate) {
      contractavailabilitydate = valor;
    }
    if (campo == CampoChangeOrder.contractorsetupfortcaperiod) {
      contractorsetupfortcaperiod = valor;
    }
    if (campo == CampoChangeOrder.notetonextcontractstatus) {
      notetonextcontractstatus = valor;
    }
    if (campo == CampoChangeOrder.numberofchangeorderformerlyapproved) {
      numberofchangeorderformerlyapproved = valor;
    }
    if (campo == CampoChangeOrder.lastcaformerlyapproveddate) {
      lastcaformerlyapproveddate = valor;
    }
    if (campo == CampoChangeOrder.reasonclassification) {
      reasonclassification = valor;
    }
    if (campo == CampoChangeOrder.changeordercategory) {
      changeordercategory = valor;
    }
    if (campo == CampoChangeOrder.changeorderlevel) {
      changeorderlevel = valor;
      setSignatures();
    }
    if (campo == CampoChangeOrder.finalauthorizer) {
      finalauthorizer = valor;
    }
    if (campo == CampoChangeOrder.reason) {
      reason = valor;
    }
    if (campo == CampoChangeOrder.extensionofamount) {
      extensionofamount = valor;
      setLevel();
      setCategory();
      if (valor == 'false') {
        amountoftheoriginalcontract = '';
        amountoftheoriginalcontracteuro = '';
        amountoftheoriginalcontractdollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionunderapprova = '';
        amountofextensionunderapprovaeuro = '';
        amountofextensionunderapprovadollar = '';
        changeorderamount = '';
        changeorderamounteuro = '';
      }
    }
    if (campo == CampoChangeOrder.currentcurrencyexchangevalue) {
      if (valor.isEmpty || valor == '0') {
        currentcurrencyexchangevalue = '1';
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountoftheoriginalcontract = '';
        amountoftheoriginalcontracteuro = '';
        amountoftheoriginalcontractdollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionunderapprova = '';
        amountofextensionunderapprovaeuro = '';
        amountofextensionunderapprovadollar = '';
        changeorderamount = '';
        changeorderamounteuro = '';
      } else {
        currentcurrencyexchangevalue = valor;
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountoftheoriginalcontract = '';
        amountoftheoriginalcontracteuro = '';
        amountoftheoriginalcontractdollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionunderapprova = '';
        amountofextensionunderapprovaeuro = '';
        amountofextensionunderapprovadollar = '';
        changeorderamount = '';
        changeorderamounteuro = '';
        percentageincrease = '';
      }
    }
    if (campo == CampoChangeOrder.amountoftheoriginalcontract) {
      amountoftheoriginalcontract = valor;
      if (valor.isNotEmpty) {
        amountoftheoriginalcontracteuro =
            (aEntero(amountoftheoriginalcontract) /
                    aEntero(currentcurrencyexchangevalue))
                .floor()
                .toString();
        setAmountValues();
      } else {
        amountoftheoriginalcontracteuro = '';
      }
    }
    if (campo == CampoChangeOrder.amountoftheoriginalcontracteuro) {
      amountoftheoriginalcontracteuro = valor;
      if (valor.isNotEmpty) {
        amountoftheoriginalcontract =
            (aEntero(amountoftheoriginalcontracteuro) *
                    aEntero(currentcurrencyexchangevalue))
                .toString();
        setAmountValues();
      } else {
        amountoftheoriginalcontract = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionsformerlyapproved) {
      amountofextensionsformerlyapproved = valor;
      if (valor.isNotEmpty) {
        amountofextensionsformerlyapprovedeuro =
            (aEntero(amountofextensionsformerlyapproved) /
                    aEntero(currentcurrencyexchangevalue))
                .floor()
                .toString();
        setAmountValues();
      } else {
        amountofextensionsformerlyapprovedeuro = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionsformerlyapprovedeuro) {
      amountofextensionsformerlyapprovedeuro = valor;
      if (valor.isNotEmpty) {
        amountofextensionsformerlyapproved =
            (aEntero(amountofextensionsformerlyapprovedeuro) *
                    aEntero(currentcurrencyexchangevalue))
                .toString();
        setAmountValues();
      } else {
        amountofextensionsformerlyapproved = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionunderapprova) {
      amountofextensionunderapprova = valor;
      if (valor.isNotEmpty) {
        amountofextensionunderapprovaeuro =
            (aEntero(amountofextensionunderapprova) /
                    aEntero(currentcurrencyexchangevalue))
                .floor()
                .toString();
        setAmountValues();
      } else {
        amountofextensionunderapprovaeuro = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionunderapprovaeuro) {
      amountofextensionunderapprovaeuro = valor;
      if (valor.isNotEmpty) {
        amountofextensionunderapprova =
            (aEntero(amountofextensionunderapprovaeuro) *
                    aEntero(currentcurrencyexchangevalue))
                .toString();
        setAmountValues();
      } else {
        amountofextensionunderapprova = '';
      }
    }
    if (campo == CampoChangeOrder.changeorderamount) {
      changeorderamount = valor;
    }
    if (campo == CampoChangeOrder.changeorderamounteuro) {
      changeorderamounteuro = valor;
    }
    if (campo == CampoChangeOrder.percentageincrease) {
      percentageincrease = valor;
    }
    if (campo == CampoChangeOrder.extensionofduration) {
      extensionofduration = valor;
      setLevel();
      setCategory();
      if (valor == 'false') {
        durationoftheoriginalcontract = '';
        durationofextensionsapprovedformerly = '';
        durationofextensionunderapproval = '';
        changeorderduration = '';
      }
    }
    if (campo == CampoChangeOrder.durationoftheoriginalcontract) {
      durationoftheoriginalcontract = valor;
      setDurationValues();
    }
    if (campo == CampoChangeOrder.durationofextensionsapprovedformerly) {
      durationofextensionsapprovedformerly = valor;
      setDurationValues();
    }
    if (campo == CampoChangeOrder.durationofextensionunderapproval) {
      durationofextensionunderapproval = valor;
      setDurationValues();
    }
    if (campo == CampoChangeOrder.changeorderduration) {
      changeorderduration = valor;
    }
    if (campo == CampoChangeOrder.supplierqualifiedformgofthecontract) {
      supplierqualifiedformgofthecontract = valor;
    }
    if (campo == CampoChangeOrder.mghighmediumriskpresentinthecontract) {
      mghighmediumriskpresentinthecontract = valor;
    }
    if (campo == CampoChangeOrder.positiveevaluationhseq) {
      positiveevaluationhseq = valor;
    }
    if (campo == CampoChangeOrder.note) {
      note = valor;
    }
    if (campo == CampoChangeOrder.unit1) {
      unit1 = valor;
    }
    if (campo == CampoChangeOrder.namesurname1) {
      namesurname1 = valor;
    }
    if (campo == CampoChangeOrder.unit2) {
      unit2 = valor;
    }
    if (campo == CampoChangeOrder.namesurname2) {
      namesurname2 = valor;
    }
    if (campo == CampoChangeOrder.unit3) {
      unit3 = valor;
    }
    if (campo == CampoChangeOrder.namesurname3) {
      namesurname3 = valor;
    }
    if (campo == CampoChangeOrder.unitglobalsccm) {
      unitglobalsccm = valor;
    }
    if (campo == CampoChangeOrder.headofsccm) {
      headofsccm = valor;
    }
    if (campo == CampoChangeOrder.headofglobalscwscm) {
      headofglobalscwscm = valor;
    }
    if (campo == CampoChangeOrder.headofglobalsccm) {
      headofglobalsccm = valor;
    }
    if (campo == CampoChangeOrder.headofglobalomec) {
      headofglobalomec = valor;
    }
    if (campo == CampoChangeOrder.headofglobalin) {
      headofglobalin = valor;
    }
    if (campo == CampoChangeOrder.headforelevantglobalfunctions) {
      headforelevantglobalfunctions = valor;
    }
    if (campo == CampoChangeOrder.globalunitglobalsccm) {
      globalunitglobalsccm = valor;
    }
    if (campo == CampoChangeOrder.globalheadofsccm) {
      globalheadofsccm = valor;
    }
    if (campo == CampoChangeOrder.globalheadofglobalsccm) {
      globalheadofglobalsccm = valor;
    }
    if (campo == CampoChangeOrder.globalheadofglobalomec) {
      globalheadofglobalomec = valor;
    }
    if (campo == CampoChangeOrder.globalheadofglobalin) {
      globalheadofglobalin = valor;
    }
    if (campo == CampoChangeOrder.estado) {
      estado = valor;
    }
    if (campo == CampoChangeOrder.usuario) {
      usuario = valor;
    }
    if (campo == CampoChangeOrder.comentario) {
      comentario = valor;
    }
    if (campo == CampoChangeOrder.fecharegistro) {
      fecharegistro = valor;
    }
    if (campo == CampoChangeOrder.historialestados) {
      historialestados = valor;
    }
    if (campo == CampoChangeOrder.trmfecha) {
      trmfecha = valor;
    }
    if (campo == CampoChangeOrder.trmfuente) {
      trmfuente = valor;
    }
    if (campo == CampoChangeOrder.trm) {
      if (valor.isEmpty || valor == '0') {
        trm = '1';
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountoftheoriginalcontract = '';
        amountoftheoriginalcontracteuro = '';
        amountoftheoriginalcontractdollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionunderapprova = '';
        amountofextensionunderapprovaeuro = '';
        amountofextensionunderapprovadollar = '';
        changeorderamount = '';
        changeorderamounteuro = '';
      } else {
        trm = valor;
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountofthecontract = '';
        amountofthecontracteuro = '';
        amountofthecontractdollar = '';
        residualamount = '';
        residualamounteuro = '';
        residualamountdollar = '';
        amountoftheoriginalcontract = '';
        amountoftheoriginalcontracteuro = '';
        amountoftheoriginalcontractdollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionsformerlyapproved = '';
        amountofextensionsformerlyapprovedeuro = '';
        amountofextensionsformerlyapproveddollar = '';
        amountofextensionunderapprova = '';
        amountofextensionunderapprovaeuro = '';
        amountofextensionunderapprovadollar = '';
        changeorderamount = '';
        changeorderamounteuro = '';
        percentageincrease = '';
      }
    }
    if (campo == CampoChangeOrder.amountofthecontractdollar) {
      amountofthecontractdollar = valor;
      if (valor.isNotEmpty) {
        amountofthecontract = dolarACop(valor);
        amountofthecontracteuro = copAEuro(amountofthecontract);
        setAmountValues();
      } else {
        amountofthecontract = '';
      }
    }
    if (campo == CampoChangeOrder.residualamountdollar) {
      residualamountdollar = valor;
      if (valor.isNotEmpty) {
        residualamount = dolarACop(valor);
        residualamounteuro = copAEuro(residualamount);
        setAmountValues();
      } else {
        residualamount = '';
      }
    }
    if (campo == CampoChangeOrder.amountoftheoriginalcontractdollar) {
      amountoftheoriginalcontractdollar = valor;
      if (valor.isNotEmpty) {
        amountoftheoriginalcontract = dolarACop(valor);
        amountoftheoriginalcontracteuro = copAEuro(amountoftheoriginalcontract);
        setAmountValues();
      } else {
        amountoftheoriginalcontract = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionsformerlyapproveddollar) {
      amountofextensionsformerlyapproveddollar = valor;
      if (valor.isNotEmpty) {
        amountofextensionsformerlyapproved = dolarACop(valor);
        amountofextensionsformerlyapprovedeuro =
            copAEuro(amountofextensionsformerlyapproved);
        setAmountValues();
      } else {
        amountofextensionsformerlyapproved = '';
      }
    }
    if (campo == CampoChangeOrder.amountofextensionunderapprovadollar) {
      amountofextensionunderapprovadollar = valor;
      if (valor.isNotEmpty) {
        amountofextensionunderapprova = dolarACop(valor);
        amountofextensionunderapprovaeuro =
            copAEuro(amountofextensionunderapprova);
        setAmountValues();
      } else {
        amountofextensionunderapprova = '';
      }
    }
  }

  dolarACop(value) {
    return (aEntero(value) * aEntero(trm)).toString();
  }

  copAEuro(value) {
    return (aEntero(value) / aEntero(currentcurrencyexchangevalue))
        .floor()
        .toString();
  }

  setAmountValues() {
    changeorderamount = (aEntero(amountoftheoriginalcontract) +
            aEntero(amountofextensionsformerlyapproved) +
            aEntero(amountofextensionunderapprova))
        .toString();
    changeorderamounteuro =
        (aEntero(changeorderamount) / aEntero(currentcurrencyexchangevalue))
            .floor()
            .toString();
    percentageincrease = (100 *
            aEntero(amountofextensionunderapprova) /
            (aEnteroNoCero(amountoftheoriginalcontract) +
                aEntero(amountofextensionsformerlyapproved)))
        .toStringAsFixed(1);
    setLevel();
    setCategory();
  }

  setDurationValues() {
    changeorderduration = (aDoble(durationoftheoriginalcontract) +
            aDoble(durationofextensionsapprovedformerly) +
            aDoble(durationofextensionunderapproval))
        .toStringAsFixed(1);
    setLevel();
    setCategory();
  }

  setTotalMonths() {
    if (contractstartdate.isNotEmpty && contractenddate.isNotEmpty) {
      contractstartdate = contractstartdate.replaceAll('/', '-');
      contractenddate = contractenddate.replaceAll('/', '-');
      totalmonths =
          ((DateTime.parse(contractenddate).subtract(const Duration(hours: 12)))
                      .difference(DateTime.parse(contractstartdate))
                      .inDays /
                  (365 / 12))
              .toStringAsFixed(1);
      totalmonths = aDoble(totalmonths) < 0 ? 'Error' : totalmonths;
    }
  }

  setLevel() {
    changeorderlevel = 'Level IV';
    if (aDoble(totalmonths) < 36 || aDoble(changeorderduration) < 36) {
      if (changeorderamounteuro.isNotEmpty && extensionofamount == 'true') {
        if (aEntero(changeorderamounteuro) < 150000) {
          changeorderlevel = 'Level IV';
        } else if (aEntero(changeorderamounteuro) < 1500000) {
          changeorderlevel = 'Level IV';
        } else if (aEntero(changeorderamounteuro) < 5000000) {
          changeorderlevel = 'Level III';
        } else if (aEntero(changeorderamounteuro) < 25000000) {
          changeorderlevel = 'Level II';
        } else {
          changeorderlevel = 'Level I';
        }
      }
    } else {
      if (changeorderamounteuro.isNotEmpty && extensionofamount == 'true') {
        if (aEntero(changeorderamounteuro) < 150000) {
          changeorderlevel = 'Level IV';
        } else {
          changeorderlevel = 'Level I';
        }
      }
    }
    // print('changeorderlevel: $changeorderlevel');
    setSignatures();
  }

  setCategory() {
    changeordercategory = 'Category A';
    if (extensionofduration == 'true' && extensionofamount == 'false') {
      changeordercategory = 'Category A';
    }
    if (aDoble(totalmonths) <= 36 &&
        extensionofduration == 'false' &&
        extensionofamount == 'true') {
      changeordercategory = 'Category B';
    }
    if (aDoble(changeorderduration) <= 36 &&
        extensionofduration == 'true' &&
        extensionofamount == 'true') {
      changeordercategory = 'Category C';
    }
    if (aDoble(totalmonths) > 36 &&
        extensionofduration == 'false' &&
        extensionofamount == 'true') {
      changeordercategory = 'Category D';
    }
    if (aDoble(changeorderduration) > 36 &&
        extensionofduration == 'true' &&
        extensionofamount == 'true') {
      changeordercategory = 'Category E';
    }
  }

  setSignatures() {
    unit2 = '';
    unit3 = '';
    namesurname2 = '';
    namesurname3 = '';
    unitglobalsccm = '';
    headofsccm = '';
    headofglobalsccm = '';
    headofglobalomec = '';
    headofglobalin = '';
    bool esMayorA100 = aDoble(percentageincrease) > 100;
    bool nivel1 = changeorderlevel == 'Level I';
    bool nivel2 = changeorderlevel == 'Level II';
    bool nivel3 = changeorderlevel == 'Level III';
    bool nivel3o4 =
        changeorderlevel == 'Level IV' || changeorderlevel == 'Level III';
    // print('responsabilityarea: $responsabilityarea');
    if (responsabilityarea == 'E&C Contract Management') {
      unit1 = 'Head of Local CM';
      namesurname1 = 'PAOLA BARATTO CALLEJAS';
      unit2 = 'Head of Local PM&C';
      namesurname2 = 'LUIS ALEJANDRO RINCON SILVA';
      finalauthorizer = 'Head Local E&C';
      if (esMayorA100 && nivel3o4) {
        unit3 = 'Head of Local I&N';
        namesurname3 = 'MONICA CATTALDO';
        finalauthorizer = 'Head Local I&N';
      }
      if (nivel3 && finalauthorizer != 'Head Local I&N') {
        headofglobalsccm = 'LUCIA DI MARCO';
        finalauthorizer = 'Head Global O&M/SC';
      }
      if (nivel2) {
        unit3 = 'Local I&N';
        namesurname3 = 'MONICA CATTALDO';
        headofglobalsccm = 'ANDREA BALENA';
        headofglobalomec = 'FRANCESCO BERTOLI';
        finalauthorizer = 'Head Global E&C';
      }
      if (nivel1) {
        unit3 = 'Local I&N';
        namesurname3 = 'MONICA CATTALDO';
        headofglobalsccm = 'ANDREA BALENA';
        headofglobalomec = 'FRANCESCO BERTOLI';
        headofglobalin = 'GIANNI VITTORIO ARMANI';
        finalauthorizer = 'Head of Enel Grids';
      }
    }
    if (responsabilityarea == 'O&M Operation & Maintenance') {
      unit1 = 'Head of Local O&M';
      namesurname1 = 'DENIS ADRIAN ALBARRACIN VACCA';
      finalauthorizer = 'Head Local O&M';
      if (esMayorA100 && nivel3o4) {
        unit2 = 'Head of Local I&N';
        namesurname2 = 'MONICA CATTALDO';
      }
      if (nivel3) {
        unitglobalsccm = 'JUAN AREVALO';
        headofglobalscwscm = 'DOMENICO MOLA';
        headofglobalsccm = 'LUCIA DI MARCO';
        finalauthorizer = 'Head Global O&M Supply Chain';
      }
      if (nivel2) {
        unit2 = 'Local I&N';
        namesurname3 = 'MONICA CATTALDO';
        unitglobalsccm = 'JUAN AREVALO';
        headofglobalsccm = 'LUCIA DI MARCO';
        headofglobalomec = 'GIANLUCA PALUMBO';
        finalauthorizer = 'Head Global O&M';
      }
      if (nivel1) {
        unit2 = 'Local I&N';
        namesurname3 = 'MONICA CATTALDO';
        unitglobalsccm = 'JUAN AREVALO';
        headofglobalsccm = 'LUCIA DI MARCO';
        headofglobalomec = 'GIANLUCA PALUMBO';
        headofglobalin = 'GIANNI ARMANI';
        finalauthorizer = 'Head of Enel Grids';
      }
    }
  }

  ChangeOrder copyWith({
    String? id,
    String? responsabilityarea,
    String? requesttype,
    String? idelectronicsignaturetool,
    String? localidcode,
    String? date,
    String? local,
    String? area,
    String? country,
    String? region,
    String? unit,
    String? contractcode,
    String? contracawardedbydirectawarding,
    String? suppliercode,
    String? suppliername,
    String? mg,
    String? mgdescription,
    String? objectofthecontract,
    String? contractstartdate,
    String? contractenddate,
    String? totalmonths,
    String? amountofthecontract,
    String? amountofthecontracteuro,
    String? residualamount,
    String? residualamounteuro,
    String? optionandtolerancealreadyactivated,
    String? newcontractalreadyplanned,
    String? purchasedrequestcode,
    String? smartplanningtoolrequirementid,
    String? prrelasedate,
    String? contractavailabilitydate,
    String? contractorsetupfortcaperiod,
    String? notetonextcontractstatus,
    String? numberofchangeorderformerlyapproved,
    String? lastcaformerlyapproveddate,
    String? reasonclassification,
    String? changeordercategory,
    String? changeorderlevel,
    String? finalauthorizer,
    String? reason,
    String? extensionofamount,
    String? currentcurrencyexchangevalue,
    String? amountoftheoriginalcontract,
    String? amountoftheoriginalcontracteuro,
    String? amountofextensionsformerlyapproved,
    String? amountofextensionsformerlyapprovedeuro,
    String? amountofextensionunderapprova,
    String? amountofextensionunderapprovaeuro,
    String? changeorderamount,
    String? changeorderamounteuro,
    String? percentageincrease,
    String? extensionofduration,
    String? durationoftheoriginalcontract,
    String? durationofextensionsapprovedformerly,
    String? durationofextensionunderapproval,
    String? changeorderduration,
    String? supplierqualifiedformgofthecontract,
    String? mghighmediumriskpresentinthecontract,
    String? positiveevaluationhseq,
    String? note,
    String? unit1,
    String? namesurname1,
    String? unit2,
    String? namesurname2,
    String? unit3,
    String? namesurname3,
    String? unitglobalsccm,
    String? headofglobalscwscm,
    String? headofsccm,
    String? headofglobalsccm,
    String? headofglobalomec,
    String? headofglobalin,
    String? headforelevantglobalfunctions,
    String? globalunitglobalsccm,
    String? globalheadofsccm,
    String? globalheadofglobalsccm,
    String? globalheadofglobalomec,
    String? globalheadofglobalin,
    String? estado,
    String? usuario,
    String? usuariocorreo,
    String? comentario,
    String? fecharegistro,
    String? historialestados,
    String? trmfecha,
    String? trmfuente,
    String? trm,
    String? amountofthecontractdollar,
    String? residualamountdollar,
    String? amountoftheoriginalcontractdollar,
    String? amountofextensionsformerlyapproveddollar,
    String? amountofextensionunderapprovadollar,
  }) {
    return ChangeOrder(
      id: id ?? this.id,
      responsabilityarea: responsabilityarea ?? this.responsabilityarea,
      requesttype: requesttype ?? this.requesttype,
      idelectronicsignaturetool:
          idelectronicsignaturetool ?? this.idelectronicsignaturetool,
      localidcode: localidcode ?? this.localidcode,
      date: date ?? this.date,
      local: local ?? this.local,
      area: area ?? this.area,
      country: country ?? this.country,
      region: region ?? this.region,
      unit: unit ?? this.unit,
      contractcode: contractcode ?? this.contractcode,
      contracawardedbydirectawarding:
          contracawardedbydirectawarding ?? this.contracawardedbydirectawarding,
      suppliercode: suppliercode ?? this.suppliercode,
      suppliername: suppliername ?? this.suppliername,
      mg: mg ?? this.mg,
      mgdescription: mgdescription ?? this.mgdescription,
      objectofthecontract: objectofthecontract ?? this.objectofthecontract,
      contractstartdate: contractstartdate ?? this.contractstartdate,
      contractenddate: contractenddate ?? this.contractenddate,
      totalmonths: totalmonths ?? this.totalmonths,
      amountofthecontract: amountofthecontract ?? this.amountofthecontract,
      amountofthecontracteuro:
          amountofthecontracteuro ?? this.amountofthecontracteuro,
      residualamount: residualamount ?? this.residualamount,
      residualamounteuro: residualamounteuro ?? this.residualamounteuro,
      optionandtolerancealreadyactivated: optionandtolerancealreadyactivated ??
          this.optionandtolerancealreadyactivated,
      newcontractalreadyplanned:
          newcontractalreadyplanned ?? this.newcontractalreadyplanned,
      purchasedrequestcode: purchasedrequestcode ?? this.purchasedrequestcode,
      smartplanningtoolrequirementid:
          smartplanningtoolrequirementid ?? this.smartplanningtoolrequirementid,
      prrelasedate: prrelasedate ?? this.prrelasedate,
      contractavailabilitydate:
          contractavailabilitydate ?? this.contractavailabilitydate,
      contractorsetupfortcaperiod:
          contractorsetupfortcaperiod ?? this.contractorsetupfortcaperiod,
      notetonextcontractstatus:
          notetonextcontractstatus ?? this.notetonextcontractstatus,
      numberofchangeorderformerlyapproved:
          numberofchangeorderformerlyapproved ??
              this.numberofchangeorderformerlyapproved,
      lastcaformerlyapproveddate:
          lastcaformerlyapproveddate ?? this.lastcaformerlyapproveddate,
      reasonclassification: reasonclassification ?? this.reasonclassification,
      changeordercategory: changeordercategory ?? this.changeordercategory,
      changeorderlevel: changeorderlevel ?? this.changeorderlevel,
      finalauthorizer: finalauthorizer ?? this.finalauthorizer,
      reason: reason ?? this.reason,
      extensionofamount: extensionofamount ?? this.extensionofamount,
      currentcurrencyexchangevalue:
          currentcurrencyexchangevalue ?? this.currentcurrencyexchangevalue,
      amountoftheoriginalcontract:
          amountoftheoriginalcontract ?? this.amountoftheoriginalcontract,
      amountoftheoriginalcontracteuro: amountoftheoriginalcontracteuro ??
          this.amountoftheoriginalcontracteuro,
      amountofextensionsformerlyapproved: amountofextensionsformerlyapproved ??
          this.amountofextensionsformerlyapproved,
      amountofextensionsformerlyapprovedeuro:
          amountofextensionsformerlyapprovedeuro ??
              this.amountofextensionsformerlyapprovedeuro,
      amountofextensionunderapprova:
          amountofextensionunderapprova ?? this.amountofextensionunderapprova,
      amountofextensionunderapprovaeuro: amountofextensionunderapprovaeuro ??
          this.amountofextensionunderapprovaeuro,
      changeorderamount: changeorderamount ?? this.changeorderamount,
      changeorderamounteuro:
          changeorderamounteuro ?? this.changeorderamounteuro,
      percentageincrease: percentageincrease ?? this.percentageincrease,
      extensionofduration: extensionofduration ?? this.extensionofduration,
      durationoftheoriginalcontract:
          durationoftheoriginalcontract ?? this.durationoftheoriginalcontract,
      durationofextensionsapprovedformerly:
          durationofextensionsapprovedformerly ??
              this.durationofextensionsapprovedformerly,
      durationofextensionunderapproval: durationofextensionunderapproval ??
          this.durationofextensionunderapproval,
      changeorderduration: changeorderduration ?? this.changeorderduration,
      supplierqualifiedformgofthecontract:
          supplierqualifiedformgofthecontract ??
              this.supplierqualifiedformgofthecontract,
      mghighmediumriskpresentinthecontract:
          mghighmediumriskpresentinthecontract ??
              this.mghighmediumriskpresentinthecontract,
      positiveevaluationhseq:
          positiveevaluationhseq ?? this.positiveevaluationhseq,
      note: note ?? this.note,
      unit1: unit1 ?? this.unit1,
      namesurname1: namesurname1 ?? this.namesurname1,
      unit2: unit2 ?? this.unit2,
      namesurname2: namesurname2 ?? this.namesurname2,
      unit3: unit3 ?? this.unit3,
      namesurname3: namesurname3 ?? this.namesurname3,
      unitglobalsccm: unitglobalsccm ?? this.unitglobalsccm,
      headofglobalscwscm: headofglobalscwscm ?? this.headofglobalscwscm,
      headofsccm: headofsccm ?? this.headofsccm,
      headofglobalsccm: headofglobalsccm ?? this.headofglobalsccm,
      headofglobalomec: headofglobalomec ?? this.headofglobalomec,
      headofglobalin: headofglobalin ?? this.headofglobalin,
      headforelevantglobalfunctions:
          headforelevantglobalfunctions ?? this.headforelevantglobalfunctions,
      globalunitglobalsccm: globalunitglobalsccm ?? this.globalunitglobalsccm,
      globalheadofsccm: globalheadofsccm ?? this.globalheadofsccm,
      globalheadofglobalsccm:
          globalheadofglobalsccm ?? this.globalheadofglobalsccm,
      globalheadofglobalomec:
          globalheadofglobalomec ?? this.globalheadofglobalomec,
      globalheadofglobalin: globalheadofglobalin ?? this.globalheadofglobalin,
      estado: estado ?? this.estado,
      usuario: usuario ?? this.usuario,
      usuariocorreo: usuariocorreo ?? this.usuariocorreo,
      comentario: comentario ?? this.comentario,
      fecharegistro: fecharegistro ?? this.fecharegistro,
      historialestados: historialestados ?? this.historialestados,
      trmfecha: trmfecha ?? this.trmfecha,
      trmfuente: trmfuente ?? this.trmfuente,
      trm: trm ?? this.trm,
      amountofthecontractdollar:
          amountofthecontractdollar ?? this.amountofthecontractdollar,
      residualamountdollar: residualamountdollar ?? this.residualamountdollar,
      amountoftheoriginalcontractdollar: amountoftheoriginalcontractdollar ??
          this.amountoftheoriginalcontractdollar,
      amountofextensionsformerlyapproveddollar:
          amountofextensionsformerlyapproveddollar ??
              this.amountofextensionsformerlyapproveddollar,
      amountofextensionunderapprovadollar:
          amountofextensionunderapprovadollar ??
              this.amountofextensionunderapprovadollar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'responsabilityarea': responsabilityarea,
      'requesttype': requesttype,
      'idelectronicsignaturetool': idelectronicsignaturetool,
      'localidcode': localidcode,
      'date': date,
      'local': local,
      'area': area,
      'country': country,
      'region': region,
      'unit': unit,
      'contractcode': contractcode,
      'contracawardedbydirectawarding': contracawardedbydirectawarding,
      'suppliercode': suppliercode,
      'suppliername': suppliername,
      'mg': mg,
      'mgdescription': mgdescription,
      'objectofthecontract': objectofthecontract,
      'contractstartdate': contractstartdate,
      'contractenddate': contractenddate,
      'totalmonths': totalmonths,
      'amountofthecontract': amountofthecontract,
      'amountofthecontracteuro': amountofthecontracteuro,
      'residualamount': residualamount,
      'residualamounteuro': residualamounteuro,
      'optionandtolerancealreadyactivated': optionandtolerancealreadyactivated,
      'newcontractalreadyplanned': newcontractalreadyplanned,
      'purchasedrequestcode': purchasedrequestcode,
      'smartplanningtoolrequirementid': smartplanningtoolrequirementid,
      'prrelasedate': prrelasedate,
      'contractavailabilitydate': contractavailabilitydate,
      'contractorsetupfortcaperiod': contractorsetupfortcaperiod,
      'notetonextcontractstatus': notetonextcontractstatus,
      'numberofchangeorderformerlyapproved':
          numberofchangeorderformerlyapproved,
      'lastcaformerlyapproveddate': lastcaformerlyapproveddate,
      'reasonclassification': reasonclassification,
      'changeordercategory': changeordercategory,
      'changeorderlevel': changeorderlevel,
      'finalauthorizer': finalauthorizer,
      'reason': reason,
      'extensionofamount': extensionofamount,
      'currentcurrencyexchangevalue': currentcurrencyexchangevalue,
      'amountoftheoriginalcontract': amountoftheoriginalcontract,
      'amountoftheoriginalcontracteuro': amountoftheoriginalcontracteuro,
      'amountofextensionsformerlyapproved': amountofextensionsformerlyapproved,
      'amountofextensionsformerlyapprovedeuro':
          amountofextensionsformerlyapprovedeuro,
      'amountofextensionunderapprova': amountofextensionunderapprova,
      'amountofextensionunderapprovaeuro': amountofextensionunderapprovaeuro,
      'changeorderamount': changeorderamount,
      'changeorderamounteuro': changeorderamounteuro,
      'percentageincrease': percentageincrease,
      'extensionofduration': extensionofduration,
      'durationoftheoriginalcontract': durationoftheoriginalcontract,
      'durationofextensionsapprovedformerly':
          durationofextensionsapprovedformerly,
      'durationofextensionunderapproval': durationofextensionunderapproval,
      'changeorderduration': changeorderduration,
      'supplierqualifiedformgofthecontract':
          supplierqualifiedformgofthecontract,
      'mghighmediumriskpresentinthecontract':
          mghighmediumriskpresentinthecontract,
      'positiveevaluationhseq': positiveevaluationhseq,
      'note': note,
      'unit1': unit1,
      'namesurname1': namesurname1,
      'unit2': unit2,
      'namesurname2': namesurname2,
      'unit3': unit3,
      'namesurname3': namesurname3,
      'unitglobalsccm': unitglobalsccm,
      'headofglobalscwscm': headofglobalscwscm,
      'headofsccm': headofsccm,
      'headofglobalsccm': headofglobalsccm,
      'headofglobalomec': headofglobalomec,
      'headofglobalin': headofglobalin,
      'headforelevantglobalfunctions': headforelevantglobalfunctions,
      'globalunitglobalsccm': globalunitglobalsccm,
      'globalheadofsccm': globalheadofsccm,
      'globalheadofglobalsccm': globalheadofglobalsccm,
      'globalheadofglobalomec': globalheadofglobalomec,
      'globalheadofglobalin': globalheadofglobalin,
      'estado': estado,
      'usuario': usuario,
      'usuariocorreo': usuariocorreo,
      'comentario': comentario,
      'fecharegistro': fecharegistro,
      'historialestados': historialestados.toString(),
      'trmfecha': trmfecha,
      'trmfuente': trmfuente,
      'trm': trm,
      'amountofthecontractdollar': amountofthecontractdollar,
      'residualamountdollar': residualamountdollar,
      'amountoftheoriginalcontractdollar': amountoftheoriginalcontractdollar,
      'amountofextensionsformerlyapproveddollar':
          amountofextensionsformerlyapproveddollar,
      'amountofextensionunderapprovadollar':
          amountofextensionunderapprovadollar,
    };
  }

  factory ChangeOrder.fromMap(Map<String, dynamic> map) {
    return ChangeOrder(
      id: map['id'].toString(),
      responsabilityarea: map['responsabilityarea'].toString(),
      requesttype: map['requesttype'].toString(),
      idelectronicsignaturetool: map['idelectronicsignaturetool'].toString(),
      localidcode: map['localidcode'].toString(),
      date: map['date'].toString().isNotEmpty
          ? map['date'].toString().substring(0, 10)
          : '',
      local: map['local'].toString(),
      area: map['area'].toString(),
      country: map['country'].toString(),
      region: map['region'].toString(),
      unit: map['unit'].toString(),
      contractcode: map['contractcode'].toString(),
      contracawardedbydirectawarding:
          map['contracawardedbydirectawarding'].toString(),
      suppliercode: map['suppliercode'].toString(),
      suppliername: map['suppliername'].toString(),
      mg: map['mg'].toString(),
      mgdescription: map['mgdescription'].toString(),
      objectofthecontract: map['objectofthecontract'].toString(),
      contractstartdate: map['contractstartdate'].toString().isNotEmpty
          ? map['contractstartdate'].toString().substring(0, 10)
          : '',
      contractenddate: map['contractenddate'].toString().isNotEmpty
          ? map['contractenddate'].toString().substring(0, 10)
          : '',
      totalmonths: map['totalmonths'].toString(),
      amountofthecontract: map['amountofthecontract'].toString(),
      amountofthecontracteuro: map['amountofthecontracteuro'].toString(),
      residualamount: map['residualamount'].toString(),
      residualamounteuro: map['residualamounteuro'].toString(),
      optionandtolerancealreadyactivated:
          map['optionandtolerancealreadyactivated'].toString(),
      newcontractalreadyplanned: map['newcontractalreadyplanned'].toString(),
      purchasedrequestcode: map['purchasedrequestcode'].toString(),
      smartplanningtoolrequirementid:
          map['smartplanningtoolrequirementid'].toString(),
      prrelasedate: map['prrelasedate'].toString().isNotEmpty
          ? map['prrelasedate'].toString().substring(0, 10)
          : '',
      contractavailabilitydate:
          map['contractavailabilitydate'].toString().isNotEmpty
              ? map['contractavailabilitydate'].toString().substring(0, 10)
              : '',
      contractorsetupfortcaperiod:
          map['contractorsetupfortcaperiod'].toString(),
      notetonextcontractstatus: map['notetonextcontractstatus'].toString(),
      numberofchangeorderformerlyapproved:
          map['numberofchangeorderformerlyapproved'].toString(),
      lastcaformerlyapproveddate:
          map['lastcaformerlyapproveddate'].toString().isNotEmpty
              ? map['lastcaformerlyapproveddate'].toString().substring(0, 10)
              : '',
      reasonclassification: map['reasonclassification'].toString(),
      changeordercategory: map['changeordercategory'].toString(),
      changeorderlevel: map['changeorderlevel'].toString(),
      finalauthorizer: map['finalauthorizer'].toString(),
      reason: map['reason'].toString(),
      extensionofamount: map['extensionofamount'].toString(),
      currentcurrencyexchangevalue:
          map['currentcurrencyexchangevalue'].toString(),
      amountoftheoriginalcontract:
          map['amountoftheoriginalcontract'].toString(),
      amountoftheoriginalcontracteuro:
          map['amountoftheoriginalcontracteuro'].toString(),
      amountofextensionsformerlyapproved:
          map['amountofextensionsformerlyapproved'].toString(),
      amountofextensionsformerlyapprovedeuro:
          map['amountofextensionsformerlyapprovedeuro'].toString(),
      amountofextensionunderapprova:
          map['amountofextensionunderapprova'].toString(),
      amountofextensionunderapprovaeuro:
          map['amountofextensionunderapprovaeuro'].toString(),
      changeorderamount: map['changeorderamount'].toString(),
      changeorderamounteuro: map['changeorderamounteuro'].toString(),
      percentageincrease: map['percentageincrease'].toString(),
      extensionofduration: map['extensionofduration'].toString(),
      durationoftheoriginalcontract:
          map['durationoftheoriginalcontract'].toString(),
      durationofextensionsapprovedformerly:
          map['durationofextensionsapprovedformerly'].toString(),
      durationofextensionunderapproval:
          map['durationofextensionunderapproval'].toString(),
      changeorderduration: map['changeorderduration'].toString(),
      supplierqualifiedformgofthecontract:
          map['supplierqualifiedformgofthecontract'].toString(),
      mghighmediumriskpresentinthecontract:
          map['mghighmediumriskpresentinthecontract'].toString(),
      positiveevaluationhseq: map['positiveevaluationhseq'].toString(),
      note: map['note'].toString(),
      unit1: map['unit1'].toString(),
      namesurname1: map['namesurname1'].toString(),
      unit2: map['unit2'].toString(),
      namesurname2: map['namesurname2'].toString(),
      unit3: map['unit3'].toString(),
      namesurname3: map['namesurname3'].toString(),
      unitglobalsccm: map['unitglobalsccm'].toString(),
      headofglobalscwscm: map['headofglobalscwscm'].toString(),
      headofsccm: map['headofsccm'].toString(),
      headofglobalsccm: map['headofglobalsccm'].toString(),
      headofglobalomec: map['headofglobalomec'].toString(),
      headofglobalin: map['headofglobalin'].toString(),
      headforelevantglobalfunctions:
          map['headforelevantglobalfunctions'].toString(),
      globalunitglobalsccm: map['globalunitglobalsccm'].toString(),
      globalheadofsccm: map['globalheadofsccm'].toString(),
      globalheadofglobalsccm: map['globalheadofglobalsccm'].toString(),
      globalheadofglobalomec: map['globalheadofglobalomec'].toString(),
      globalheadofglobalin: map['globalheadofglobalin'].toString(),
      estado: map['estado'].toString(),
      usuario: map['usuario'].toString(),
      usuariocorreo: map['usuariocorreo'].toString(),
      comentario: map['comentario'].toString(),
      fecharegistro: map['fecharegistro'].toString().isNotEmpty
          ? map['fecharegistro'].toString().substring(0, 10)
          : '',
      historialestados: map['historialestados'].toString(),
      trmfecha: map['trmfecha'].toString(),
      trmfuente: map['trmfuente'].toString(),
      trm: map['trm'].toString(),
      amountofthecontractdollar: map['amountofthecontractdollar'].toString(),
      residualamountdollar: map['residualamountdollar'].toString(),
      amountoftheoriginalcontractdollar:
          map['amountoftheoriginalcontractdollar'].toString(),
      amountofextensionsformerlyapproveddollar:
          map['amountofextensionsformerlyapproveddollar'].toString(),
      amountofextensionunderapprovadollar:
          map['amountofextensionunderapprovadollar'].toString(),
    );
  }

  factory ChangeOrder.fromInit() {
    return ChangeOrder(
      id: '',
      responsabilityarea: 'O&M Operation & Maintenance',
      requesttype: 'Works and Services',
      idelectronicsignaturetool: '',
      localidcode: '',
      date: DateTime.now().toString().substring(0, 10),
      local: '',
      area: 'Supply Chain',
      country: 'Colombia',
      region: 'Enel Colombia',
      unit: 'Engineering and construction',
      contractcode: '',
      contracawardedbydirectawarding: 'false',
      suppliercode: '',
      suppliername: '',
      mg: '',
      mgdescription: '',
      objectofthecontract: '',
      contractstartdate: '',
      contractenddate: '',
      totalmonths: '',
      amountofthecontract: '',
      amountofthecontracteuro: '',
      residualamount: '',
      residualamounteuro: '',
      optionandtolerancealreadyactivated: 'false',
      newcontractalreadyplanned: 'false',
      purchasedrequestcode: '',
      smartplanningtoolrequirementid: '',
      prrelasedate: '',
      contractavailabilitydate: '',
      contractorsetupfortcaperiod: '',
      notetonextcontractstatus: '',
      numberofchangeorderformerlyapproved: '',
      lastcaformerlyapproveddate: '',
      reasonclassification: '',
      changeordercategory: 'Category A',
      changeorderlevel: "Level IV",
      finalauthorizer: '',
      reason: '',
      extensionofamount: 'false',
      currentcurrencyexchangevalue: '1',
      amountoftheoriginalcontract: '',
      amountoftheoriginalcontracteuro: '',
      amountofextensionsformerlyapproved: '',
      amountofextensionsformerlyapprovedeuro: '',
      amountofextensionunderapprova: '',
      amountofextensionunderapprovaeuro: '',
      changeorderamount: '',
      changeorderamounteuro: '',
      percentageincrease: '',
      extensionofduration: 'false',
      durationoftheoriginalcontract: '',
      durationofextensionsapprovedformerly: '',
      durationofextensionunderapproval: '',
      changeorderduration: '',
      supplierqualifiedformgofthecontract: 'false',
      mghighmediumriskpresentinthecontract: 'false',
      positiveevaluationhseq: 'false',
      note: '',
      unit1: '',
      namesurname1: '',
      unit2: '',
      namesurname2: '',
      unit3: '',
      namesurname3: '',
      unitglobalsccm: '',
      headofglobalscwscm: '',
      headofsccm: '',
      headofglobalsccm: '',
      headofglobalomec: '',
      headofglobalin: '',
      headforelevantglobalfunctions: '',
      globalunitglobalsccm: '',
      globalheadofsccm: '',
      globalheadofglobalsccm: '',
      globalheadofglobalomec: '',
      globalheadofglobalin: '',
      estado: '',
      usuario: '',
      usuariocorreo: '',
      comentario: '',
      fecharegistro: '',
      historialestados: '',
      trmfecha: '',
      trmfuente: '',
      trm: '1',
      amountofthecontractdollar: '',
      residualamountdollar: '',
      amountoftheoriginalcontractdollar: '',
      amountofextensionsformerlyapproveddollar: '',
      amountofextensionunderapprovadollar: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangeOrder.fromJson(String source) =>
      ChangeOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChangeOrder(id: $id, responsabilityarea: $responsabilityarea, requesttype: $requesttype, idelectronicsignaturetool: $idelectronicsignaturetool, localidcode: $localidcode, date: $date, local: $local, area: $area, country: $country, region: $region, unit: $unit, contractcode: $contractcode, contracawardedbydirectawarding: $contracawardedbydirectawarding, suppliercode: $suppliercode, suppliername: $suppliername, mg: $mg, mgdescription: $mgdescription, objectofthecontract: $objectofthecontract, contractstartdate: $contractstartdate, contractenddate: $contractenddate, totalmonths: $totalmonths, amountofthecontract: $amountofthecontract, amountofthecontracteuro: $amountofthecontracteuro, residualamount: $residualamount, residualamounteuro: $residualamounteuro, optionandtolerancealreadyactivated: $optionandtolerancealreadyactivated, newcontractalreadyplanned: $newcontractalreadyplanned, purchasedrequestcode: $purchasedrequestcode, smartplanningtoolrequirementid: $smartplanningtoolrequirementid, prrelasedate: $prrelasedate, contractavailabilitydate: $contractavailabilitydate, contractorsetupfortcaperiod: $contractorsetupfortcaperiod, notetonextcontractstatus: $notetonextcontractstatus, numberofchangeorderformerlyapproved: $numberofchangeorderformerlyapproved, lastcaformerlyapproveddate: $lastcaformerlyapproveddate, reasonclassification: $reasonclassification, changeordercategory: $changeordercategory, changeorderlevel: $changeorderlevel, finalauthorizer: $finalauthorizer, reason: $reason, extensionofamount: $extensionofamount, currentcurrencyexchangevalue: $currentcurrencyexchangevalue, amountoftheoriginalcontract: $amountoftheoriginalcontract, amountoftheoriginalcontracteuro: $amountoftheoriginalcontracteuro, amountofextensionsformerlyapproved: $amountofextensionsformerlyapproved, amountofextensionsformerlyapprovedeuro: $amountofextensionsformerlyapprovedeuro, amountofextensionunderapprova: $amountofextensionunderapprova, amountofextensionunderapprovaeuro: $amountofextensionunderapprovaeuro, changeorderamount: $changeorderamount, percentageincrease: $percentageincrease, extensionofduration: $extensionofduration, durationoftheoriginalcontract: $durationoftheoriginalcontract, durationofextensionsapprovedformerly: $durationofextensionsapprovedformerly, durationofextensionunderapproval: $durationofextensionunderapproval, changeorderduration: $changeorderduration, supplierqualifiedformgofthecontract: $supplierqualifiedformgofthecontract, mghighmediumriskpresentinthecontract: $mghighmediumriskpresentinthecontract, positiveevaluationhseq: $positiveevaluationhseq, note: $note, unit1: $unit1, namesurname1: $namesurname1, unit2: $unit2, namesurname2: $namesurname2, unit3: $unit3, namesurname3: $namesurname3, unitglobalsccm: $unitglobalsccm, headofsccm: $headofsccm, headofglobalsccm: $headofglobalsccm, headofglobalomec: $headofglobalomec, headofglobalin: $headofglobalin, headforelevantglobalfunctions: $headforelevantglobalfunctions, globalunitglobalsccm: $globalunitglobalsccm, globalheadofsccm: $globalheadofsccm, globalheadofglobalsccm: $globalheadofglobalsccm, globalheadofglobalomec: $globalheadofglobalomec, globalheadofglobalin: $globalheadofglobalin, estado: $estado, usuario: $usuario, comentario: $comentario, fecharegistro: $fecharegistro, historialestados: $historialestados, trmfecha: $trmfecha, trmfuente: $trmfuente, trm: $trm, amountofthecontractdollar: $amountofthecontractdollar, residualamountdollar: $residualamountdollar, amountoftheoriginalcontractdollar: $amountoftheoriginalcontractdollar, amountofextensionsformerlyapproveddollar: $amountofextensionsformerlyapproveddollar, amountofextensionunderapprovadollar: $amountofextensionunderapprovadollar)';
  }

  @override
  bool operator ==(covariant ChangeOrder other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.responsabilityarea == responsabilityarea &&
        other.requesttype == requesttype &&
        other.idelectronicsignaturetool == idelectronicsignaturetool &&
        other.localidcode == localidcode &&
        other.date == date &&
        other.local == local &&
        other.area == area &&
        other.country == country &&
        other.region == region &&
        other.unit == unit &&
        other.contractcode == contractcode &&
        other.contracawardedbydirectawarding ==
            contracawardedbydirectawarding &&
        other.suppliercode == suppliercode &&
        other.suppliername == suppliername &&
        other.mg == mg &&
        other.mgdescription == mgdescription &&
        other.objectofthecontract == objectofthecontract &&
        other.contractstartdate == contractstartdate &&
        other.contractenddate == contractenddate &&
        other.totalmonths == totalmonths &&
        other.amountofthecontract == amountofthecontract &&
        other.amountofthecontracteuro == amountofthecontracteuro &&
        other.residualamount == residualamount &&
        other.residualamounteuro == residualamounteuro &&
        other.optionandtolerancealreadyactivated ==
            optionandtolerancealreadyactivated &&
        other.newcontractalreadyplanned == newcontractalreadyplanned &&
        other.purchasedrequestcode == purchasedrequestcode &&
        other.smartplanningtoolrequirementid ==
            smartplanningtoolrequirementid &&
        other.prrelasedate == prrelasedate &&
        other.contractavailabilitydate == contractavailabilitydate &&
        other.contractorsetupfortcaperiod == contractorsetupfortcaperiod &&
        other.notetonextcontractstatus == notetonextcontractstatus &&
        other.numberofchangeorderformerlyapproved ==
            numberofchangeorderformerlyapproved &&
        other.lastcaformerlyapproveddate == lastcaformerlyapproveddate &&
        other.reasonclassification == reasonclassification &&
        other.changeordercategory == changeordercategory &&
        other.changeorderlevel == changeorderlevel &&
        other.finalauthorizer == finalauthorizer &&
        other.reason == reason &&
        other.extensionofamount == extensionofamount &&
        other.currentcurrencyexchangevalue == currentcurrencyexchangevalue &&
        other.amountoftheoriginalcontract == amountoftheoriginalcontract &&
        other.amountoftheoriginalcontracteuro ==
            amountoftheoriginalcontracteuro &&
        other.amountofextensionsformerlyapproved ==
            amountofextensionsformerlyapproved &&
        other.amountofextensionsformerlyapprovedeuro ==
            amountofextensionsformerlyapprovedeuro &&
        other.amountofextensionunderapprova == amountofextensionunderapprova &&
        other.amountofextensionunderapprovaeuro ==
            amountofextensionunderapprovaeuro &&
        other.changeorderamount == changeorderamount &&
        other.changeorderamounteuro == changeorderamounteuro &&
        other.percentageincrease == percentageincrease &&
        other.extensionofduration == extensionofduration &&
        other.durationoftheoriginalcontract == durationoftheoriginalcontract &&
        other.durationofextensionsapprovedformerly ==
            durationofextensionsapprovedformerly &&
        other.durationofextensionunderapproval ==
            durationofextensionunderapproval &&
        other.changeorderduration == changeorderduration &&
        other.supplierqualifiedformgofthecontract ==
            supplierqualifiedformgofthecontract &&
        other.mghighmediumriskpresentinthecontract ==
            mghighmediumriskpresentinthecontract &&
        other.positiveevaluationhseq == positiveevaluationhseq &&
        other.note == note &&
        other.unit1 == unit1 &&
        other.namesurname1 == namesurname1 &&
        other.unit2 == unit2 &&
        other.namesurname2 == namesurname2 &&
        other.unit3 == unit3 &&
        other.namesurname3 == namesurname3 &&
        other.unitglobalsccm == unitglobalsccm &&
        other.headofsccm == headofsccm &&
        other.headofglobalsccm == headofglobalsccm &&
        other.headofglobalomec == headofglobalomec &&
        other.headofglobalin == headofglobalin &&
        other.headforelevantglobalfunctions == headforelevantglobalfunctions &&
        other.globalunitglobalsccm == globalunitglobalsccm &&
        other.globalheadofsccm == globalheadofsccm &&
        other.globalheadofglobalsccm == globalheadofglobalsccm &&
        other.globalheadofglobalomec == globalheadofglobalomec &&
        other.globalheadofglobalin == globalheadofglobalin &&
        other.estado == estado &&
        other.usuario == usuario &&
        other.comentario == comentario &&
        other.fecharegistro == fecharegistro &&
        other.historialestados == historialestados &&
        other.trmfecha == trmfecha &&
        other.trmfuente == trmfuente;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        responsabilityarea.hashCode ^
        requesttype.hashCode ^
        idelectronicsignaturetool.hashCode ^
        localidcode.hashCode ^
        date.hashCode ^
        local.hashCode ^
        area.hashCode ^
        country.hashCode ^
        region.hashCode ^
        unit.hashCode ^
        contractcode.hashCode ^
        contracawardedbydirectawarding.hashCode ^
        suppliercode.hashCode ^
        suppliername.hashCode ^
        mg.hashCode ^
        mgdescription.hashCode ^
        objectofthecontract.hashCode ^
        contractstartdate.hashCode ^
        contractenddate.hashCode ^
        totalmonths.hashCode ^
        amountofthecontract.hashCode ^
        amountofthecontracteuro.hashCode ^
        residualamount.hashCode ^
        residualamounteuro.hashCode ^
        optionandtolerancealreadyactivated.hashCode ^
        newcontractalreadyplanned.hashCode ^
        purchasedrequestcode.hashCode ^
        smartplanningtoolrequirementid.hashCode ^
        prrelasedate.hashCode ^
        contractavailabilitydate.hashCode ^
        contractorsetupfortcaperiod.hashCode ^
        notetonextcontractstatus.hashCode ^
        numberofchangeorderformerlyapproved.hashCode ^
        lastcaformerlyapproveddate.hashCode ^
        reasonclassification.hashCode ^
        changeordercategory.hashCode ^
        changeorderlevel.hashCode ^
        finalauthorizer.hashCode ^
        reason.hashCode ^
        extensionofamount.hashCode ^
        currentcurrencyexchangevalue.hashCode ^
        amountoftheoriginalcontract.hashCode ^
        amountoftheoriginalcontracteuro.hashCode ^
        amountofextensionsformerlyapproved.hashCode ^
        amountofextensionsformerlyapprovedeuro.hashCode ^
        amountofextensionunderapprova.hashCode ^
        amountofextensionunderapprovaeuro.hashCode ^
        changeorderamount.hashCode ^
        changeorderamounteuro.hashCode ^
        percentageincrease.hashCode ^
        extensionofduration.hashCode ^
        durationoftheoriginalcontract.hashCode ^
        durationofextensionsapprovedformerly.hashCode ^
        durationofextensionunderapproval.hashCode ^
        changeorderduration.hashCode ^
        supplierqualifiedformgofthecontract.hashCode ^
        mghighmediumriskpresentinthecontract.hashCode ^
        positiveevaluationhseq.hashCode ^
        note.hashCode ^
        unit1.hashCode ^
        namesurname1.hashCode ^
        unit2.hashCode ^
        namesurname2.hashCode ^
        unit3.hashCode ^
        namesurname3.hashCode ^
        unitglobalsccm.hashCode ^
        headofsccm.hashCode ^
        headofglobalsccm.hashCode ^
        headofglobalomec.hashCode ^
        headofglobalin.hashCode ^
        headforelevantglobalfunctions.hashCode ^
        globalunitglobalsccm.hashCode ^
        globalheadofsccm.hashCode ^
        globalheadofglobalsccm.hashCode ^
        globalheadofglobalomec.hashCode ^
        globalheadofglobalin.hashCode ^
        estado.hashCode ^
        usuario.hashCode ^
        comentario.hashCode ^
        fecharegistro.hashCode ^
        historialestados.hashCode ^
        trmfecha.hashCode ^
        trmfuente.hashCode;
  }
}
