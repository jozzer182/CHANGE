import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../model/changeorder_enum.dart';
import '../model/changeorder_model.dart';
import 'buttons_v1.dart';
import 'changeorder_pdf.dart';
import 'fields_v1.dart';

class ChangeOrderPage extends StatefulWidget {
  final bool esNuevo;
  const ChangeOrderPage({
    super.key,
    required this.esNuevo,
  });

  @override
  State<ChangeOrderPage> createState() => _ChangeOrderPageState();
}

class _ChangeOrderPageState extends State<ChangeOrderPage> {
  late Future<String> lastNumberReg;
  Future<String> _futureLastNumberReg() async {
    String lastnumber =
        await context.read<MainBloc>().state.changeOrder!.lastNumberReg;
    if (widget.esNuevo) {
      context.read<MainBloc>().add(
            ChangeOrderField(
              tabla: "planilla",
              campo: CampoChangeOrder.localidcode,
              valor: lastnumber,
              index: 0,
            ),
          );
    }

    return lastnumber;
  }

  bool loadingFile = false;
  bool editAllFields = false;
  bool viewSignaturesFields = true;
  bool viewSignaturesGlobal = false;
  bool viewDollar = false;
  bool isX = false;

  loading(bool estado) {
    setState(() => loadingFile = estado);
  }

  edit() {
    setState(() => editAllFields = !editAllFields);
  }

  @override
  void initState() {
    if (widget.esNuevo) {
      context.read<MainBloc>().add(
            SetChangeOrder(changeOrder: ChangeOrder.fromInit()),
          );
      editAllFields = true;
      context.read<MainBloc>().add(
            ChangeOrderField(
              tabla: "planilla",
              campo: CampoChangeOrder.currentcurrencyexchangevalue,
              valor: context.read<MainBloc>().state.eurcop?.close ?? '1',
              index: 0,
            ),
          );
      context.read<MainBloc>().add(
            ChangeOrderField(
              tabla: "planilla",
              campo: CampoChangeOrder.trm,
              valor: context.read<MainBloc>().state.usdcop?.close ?? '1',
              index: 0,
            ),
          );
    }
    lastNumberReg = _futureLastNumberReg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state.changeOrder == null) {
              return const Text('Change Order');
            }
            return FutureBuilder<String>(
                future: lastNumberReg,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (!widget.esNuevo) {
                    return Text(
                        'Change Order No. ${state.changeOrder?.id} estado: ${state.changeOrder?.estado}');
                  }
                  if (snapshot.data == null) {
                    return const Row(
                      children: [
                        Text('Change Order No.'),
                        SizedBox(width: 10),
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    // print('desde el Future snapshot.data: ${snapshot.data}');
                    return Text('Change Order No. ${snapshot.data}');
                  }
                  return const Text('Change Order No. Cargando...');
                });
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocSelector<MainBloc, MainState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              return state || loadingFile
                  ? const LinearProgressIndicator()
                  : const SizedBox();
            },
          ),
        ),
        actions: [
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.changeOrder == null || editAllFields) {
                return const SizedBox();
              }
              return Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Ver en X:'),
                  Checkbox(
                    value: isX,
                    onChanged: (value) {
                      setState(() {
                        isX = value ?? false;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.changeOrder == null || editAllFields) {
                return const SizedBox();
              }
              return ElevatedButton(
                onPressed: () => generatePdf(
                  changeOrder: state.changeOrder!,
                  isX: isX
                ),
                child: const Text('PDF'),
              );
            },
          ),
          const SizedBox(width: 10),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (!editAllFields) {
                return const SizedBox();
              }
              return ElevatedButton(
                child: const Text('Guardar'),
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(
                    ValidateChangeOrder(),
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('GUARDAR'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Comentario'),
                              ),
                              onChanged: (value) {
                                context.read<MainBloc>().add(
                                      ChangeOrderField(
                                        tabla: "planilla",
                                        campo: CampoChangeOrder.comentario,
                                        valor: value,
                                        index: 0,
                                      ),
                                    );
                              },
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Estado'),
                              ),
                              onChanged: (value) {
                                context.read<MainBloc>().add(
                                      ChangeOrderField(
                                        tabla: "planilla",
                                        campo: CampoChangeOrder.estado,
                                        valor: value,
                                        index: 0,
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Guardar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              if (widget.esNuevo) {
                                BlocProvider.of<MainBloc>(context).add(
                                  AddToDbChangeOrder(context),
                                );
                              } else {
                                BlocProvider.of<MainBloc>(context).add(
                                  UpdateToDbChangeOrder(context),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(width: 10),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.user == null) {
                return const Center(child: CircularProgressIndicator());
              }
              List<String> permisos = state.user!.permisos;
              if (permisos.contains('modificar_orden')) {
                return ButtonEditar(
                  edit: edit,
                  esNuevo: widget.esNuevo,
                  text: editAllFields ? 'Cancelar' : 'Editar',
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state.changeOrder == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          ChangeOrder data = state.changeOrder!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.responsabilityarea,
                        campo: CampoChangeOrder.responsabilityarea,
                        label: 'Área de Responsabilidad',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "E&C Contract Management",
                          "O&M Operation & Maintenance"
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.requesttype,
                        campo: CampoChangeOrder.requesttype,
                        label: 'Tipo de solicitud',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Works and Services",
                          "Materials",
                          "Logistics",
                          "Global Functions"
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.idelectronicsignaturetool,
                        campo: CampoChangeOrder.idelectronicsignaturetool,
                        label: 'Id. Gosign',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.localidcode,
                        campo: CampoChangeOrder.localidcode,
                        label: 'Consecutivo',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.fecha,
                        flex: 3,
                        initialValue: data.date,
                        campo: CampoChangeOrder.date,
                        label: 'Fecha',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                Text(
                  'Información General del Contrato',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.country,
                        campo: CampoChangeOrder.country,
                        label: 'País',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Colombia",
                          "Brazil",
                          "Peru",
                          "Chile",
                          "Argentina",
                          "Spain",
                          "Italy",
                          "Romania"
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.area,
                        campo: CampoChangeOrder.area,
                        label: 'Área',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.region,
                        campo: CampoChangeOrder.region,
                        label: 'Región',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.unit,
                        campo: CampoChangeOrder.unit,
                        label: 'Unidad',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 2,
                        initialValue: data.contractcode,
                        campo: CampoChangeOrder.contractcode,
                        label: 'Código del Contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 1,
                        initialValue: data.suppliercode,
                        campo: CampoChangeOrder.suppliercode,
                        label: 'Código de proveedor (CUI)',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 4,
                        initialValue: data.suppliername,
                        campo: CampoChangeOrder.suppliername,
                        label: 'Nombre del proveedor',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 1,
                        initialValue: data.mg,
                        campo: CampoChangeOrder.mg,
                        label: 'Grupo Mercológico',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: state.gm?.lista.map((e) => e.codigo) ?? [],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 2,
                        initialValue: data.mgdescription,
                        campo: CampoChangeOrder.mgdescription,
                        label: 'Descripción del Grupo Mercológico',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 4,
                        initialValue: data.objectofthecontract,
                        campo: CampoChangeOrder.objectofthecontract,
                        label: 'Objeto del Contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.fecha,
                        flex: 3,
                        initialValue: data.contractstartdate,
                        campo: CampoChangeOrder.contractstartdate,
                        label: 'Fecha de inicio del contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.fecha,
                        flex: 3,
                        initialValue: data.contractenddate,
                        campo: CampoChangeOrder.contractenddate,
                        label: 'Fecha de finalización del contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 1,
                        initialValue: data.totalmonths,
                        campo: CampoChangeOrder.totalmonths,
                        label: 'Total meses',
                        color: Colors.grey,
                        edit: false,
                        isNumber: true,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 1,
                        initialValue: data.currentcurrencyexchangevalue,
                        campo: CampoChangeOrder.currentcurrencyexchangevalue,
                        label: 'Valor EURO (En Pesos COL)',
                        color: data.currentcurrencyexchangevalue == '1'
                            ? Colors.red
                            : Colors.grey,
                        edit: editAllFields,
                        isNumber: true,
                      ),
                      const SizedBox(width: 10),
                      if (data.trmfuente == 'true')
                        FieldPre(
                          tipoCampo: TipoCampo.texto,
                          flex: 1,
                          initialValue: data.trm,
                          campo: CampoChangeOrder.trm,
                          label: 'Valor DOLAR (En Pesos COL)',
                          color: data.trm == '1' ? Colors.red : Colors.grey,
                          edit: editAllFields,
                          isNumber: true,
                        ),
                      if (data.trmfuente == 'true') const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 1,
                        initialValue: data.trmfuente,
                        campo: CampoChangeOrder.trmfuente,
                        label: 'Valor fuente en Dólares',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  if (data.currentcurrencyexchangevalue == '1') {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 1,
                              initialValue: data.amountofthecontract,
                              campo: CampoChangeOrder.amountofthecontract,
                              label: 'Monto del contrato',
                              color: Colors.grey,
                              edit: editAllFields,
                              isNumber: true,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 1,
                              initialValue: data.amountofthecontracteuro,
                              campo: CampoChangeOrder.amountofthecontracteuro,
                              label: 'Montos del contrato (Euro)',
                              color: Colors.grey,
                              edit: editAllFields,
                              isNumber: true,
                            ),
                            if (data.trmfuente == 'true')
                              const SizedBox(width: 10),
                            if (data.trmfuente == 'true')
                              FieldPre(
                                tipoCampo: TipoCampo.texto,
                                flex: 1,
                                initialValue: data.amountofthecontractdollar,
                                campo:
                                    CampoChangeOrder.amountofthecontractdollar,
                                label: 'Montos del contrato (Dolar)',
                                color: Colors.grey,
                                edit: editAllFields,
                                isNumber: true,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 1,
                              initialValue: data.residualamount,
                              campo: CampoChangeOrder.residualamount,
                              label: 'Monto residual',
                              color: Colors.grey,
                              edit: editAllFields,
                              isNumber: true,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 1,
                              initialValue: data.residualamounteuro,
                              campo: CampoChangeOrder.residualamounteuro,
                              label: 'Monto residual (Euro)',
                              color: Colors.grey,
                              edit: editAllFields,
                              isNumber: true,
                            ),
                            if (data.trmfuente == 'true')
                              const SizedBox(width: 10),
                            if (data.trmfuente == 'true')
                              FieldPre(
                                tipoCampo: TipoCampo.texto,
                                flex: 1,
                                initialValue: data.residualamountdollar,
                                campo: CampoChangeOrder.residualamountdollar,
                                label: 'Monto residual (Dolar)',
                                color: Colors.grey,
                                edit: editAllFields,
                                isNumber: true,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.optionandtolerancealreadyactivated,
                        campo:
                            CampoChangeOrder.optionandtolerancealreadyactivated,
                        label: 'Opción y tolerancia ya activada',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.supplierqualifiedformgofthecontract,
                        campo: CampoChangeOrder
                            .supplierqualifiedformgofthecontract,
                        label: 'Proveedor calificado para MG del contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 5),
                // const Divider(),
                // Text(
                //   'Otra Información del Proveedor',
                //   style: TextStyle(
                //     color: primaryColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.contracawardedbydirectawarding,
                        campo: CampoChangeOrder.contracawardedbydirectawarding,
                        label: 'Contrato adjudicado por adjudicación directa',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.mghighmediumriskpresentinthecontract,
                        campo: CampoChangeOrder
                            .mghighmediumriskpresentinthecontract,
                        label:
                            'MG de alto / medio riesgo presente en el contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.newcontractalreadyplanned,
                        campo: CampoChangeOrder.newcontractalreadyplanned,
                        label: 'Nuevo contrato ya planificado',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.positiveevaluationhseq,
                        campo: CampoChangeOrder.positiveevaluationhseq,
                        label: 'Evaluación positiva HSEQ',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.note,
                        campo: CampoChangeOrder.note,
                        label: 'Nota',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                Text(
                  'Previsión sobre el próximo contrato',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  if (data.newcontractalreadyplanned != 'true') {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.purchasedrequestcode,
                              campo: CampoChangeOrder.purchasedrequestcode,
                              label: 'Código de solicitud de compra',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.fecha,
                              flex: 3,
                              initialValue: data.prrelasedate,
                              campo: CampoChangeOrder.prrelasedate,
                              label: 'Fecha de lanzamiento de PR',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.smartplanningtoolrequirementid,
                              campo: CampoChangeOrder
                                  .smartplanningtoolrequirementid,
                              label: 'Código de solicitud Smart Planning Tool',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.fecha,
                              flex: 3,
                              initialValue: data.contractavailabilitydate,
                              campo: CampoChangeOrder.contractavailabilitydate,
                              label: 'Fecha de disponibilidad del contrato',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.contractorsetupfortcaperiod,
                              campo:
                                  CampoChangeOrder.contractorsetupfortcaperiod,
                              label:
                                  'Configuración del contratista para el período TCA',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.notetonextcontractstatus,
                        campo: CampoChangeOrder.notetonextcontractstatus,
                        label: 'Nota al siguiente estado del contrato',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                Text(
                  'Clasificación de la Orden de Cambio',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.reasonclassification,
                        campo: CampoChangeOrder.reasonclassification,
                        label: 'Clasificación',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Additional Activities",
                          "Authority request",
                          "Extra capex",
                          "Extraordinary health events",
                          "Extraordinary weather events",
                          "Extension of geographical área",
                          "New contract not available",
                          "Special project",
                          "TCA not finalized",
                          "Other",
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.texto,
                        flex: 3,
                        initialValue: data.numberofchangeorderformerlyapproved,
                        campo: CampoChangeOrder
                            .numberofchangeorderformerlyapproved,
                        label:
                            'Número de orden de cambio aprobada anteriormente',
                        color: Colors.grey,
                        edit: editAllFields,
                        isNumber: true,
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.fecha,
                        flex: 3,
                        initialValue: data.lastcaformerlyapproveddate,
                        campo: CampoChangeOrder.lastcaformerlyapproveddate,
                        label: 'Última fecha de aprobación de CO anteriormente',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),
                const Divider(),
                Builder(builder: (context) {
                  if (data.currentcurrencyexchangevalue == '1') {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Text(
                        'Monto de la Orden de Cambio',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.switcher,
                              flex: 3,
                              initialValue: data.extensionofamount,
                              campo: CampoChangeOrder.extensionofamount,
                              label: 'Extensión de monto',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Builder(builder: (context) {
                        if (data.extensionofamount != 'true') {
                          return const SizedBox();
                        }
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue:
                                        data.amountoftheoriginalcontract,
                                    campo: CampoChangeOrder
                                        .amountoftheoriginalcontract,
                                    label: 'Monto del contrato original',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  const SizedBox(width: 10),
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue:
                                        data.amountoftheoriginalcontracteuro,
                                    campo: CampoChangeOrder
                                        .amountoftheoriginalcontracteuro,
                                    label: 'Monto del contrato original (Euro)',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  if (data.trmfuente == 'true')
                                    const SizedBox(width: 10),
                                  if (data.trmfuente == 'true')
                                    FieldPre(
                                      tipoCampo: TipoCampo.texto,
                                      flex: 3,
                                      initialValue: data
                                          .amountoftheoriginalcontractdollar,
                                      campo: CampoChangeOrder
                                          .amountoftheoriginalcontractdollar,
                                      label:
                                          'Monto del contrato original (Dolar)',
                                      color: Colors.grey,
                                      edit: editAllFields,
                                      isNumber: true,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue:
                                        data.amountofextensionsformerlyapproved,
                                    campo: CampoChangeOrder
                                        .amountofextensionsformerlyapproved,
                                    label:
                                        'Monto de extensiones aprobadas anteriormente',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  const SizedBox(width: 10),
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue: data
                                        .amountofextensionsformerlyapprovedeuro,
                                    campo: CampoChangeOrder
                                        .amountofextensionsformerlyapprovedeuro,
                                    label:
                                        'Monto de extensiones aprobadas anteriormente (Euro)',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  if (data.trmfuente == 'true')
                                    const SizedBox(width: 10),
                                  if (data.trmfuente == 'true')
                                    FieldPre(
                                      tipoCampo: TipoCampo.texto,
                                      flex: 3,
                                      initialValue: data
                                          .amountofextensionsformerlyapproveddollar,
                                      campo: CampoChangeOrder
                                          .amountofextensionsformerlyapproveddollar,
                                      label:
                                          'Monto de extensiones aprobadas anteriormente (Dolar)',
                                      color: Colors.grey,
                                      edit: editAllFields,
                                      isNumber: true,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue:
                                        data.amountofextensionunderapprova,
                                    campo: CampoChangeOrder
                                        .amountofextensionunderapprova,
                                    label: 'Monto de extensión bajo aprobación',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  const SizedBox(width: 10),
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue:
                                        data.amountofextensionunderapprovaeuro,
                                    campo: CampoChangeOrder
                                        .amountofextensionunderapprovaeuro,
                                    label:
                                        'Monto de extensión bajo aprobación (Euro)',
                                    color: Colors.grey,
                                    edit: editAllFields,
                                    isNumber: true,
                                  ),
                                  if (data.trmfuente == 'true')
                                    const SizedBox(width: 10),
                                  if (data.trmfuente == 'true')
                                    FieldPre(
                                      tipoCampo: TipoCampo.texto,
                                      flex: 3,
                                      initialValue: data
                                          .amountofextensionunderapprovadollar,
                                      campo: CampoChangeOrder
                                          .amountofextensionunderapprovadollar,
                                      label:
                                          'Monto de extensión bajo aprobación (Dolar)',
                                      color: Colors.grey,
                                      edit: editAllFields,
                                      isNumber: true,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue: data.changeorderamount,
                                    campo: CampoChangeOrder.changeorderamount,
                                    label: 'Monto de la orden de cambio',
                                    color: Colors.grey,
                                    edit: false,
                                    isNumber: true,
                                  ),
                                  const SizedBox(width: 10),
                                  FieldPre(
                                    tipoCampo: TipoCampo.texto,
                                    flex: 3,
                                    initialValue: data.changeorderamounteuro,
                                    campo:
                                        CampoChangeOrder.changeorderamounteuro,
                                    label: 'Monto de la orden de cambio (Euro)',
                                    color: Colors.grey,
                                    edit: false,
                                    isNumber: true,
                                  ),
                                  if (data.trmfuente == 'true')
                                    const SizedBox(width: 10),
                                  if (data.trmfuente == 'true')
                                    const Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  FieldPre(
                                    tipoCampo: TipoCampo.doble,
                                    flex: 3,
                                    initialValue: data.percentageincrease,
                                    campo: CampoChangeOrder.percentageincrease,
                                    label: 'Porcentaje de aumento',
                                    color: Colors.grey,
                                    edit: false,
                                    isNumber: true,
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    flex: 6,
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 5),
                      const Divider(),
                    ],
                  );
                }),
                Text(
                  'Duración de la orden de cambio',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.switcher,
                        flex: 3,
                        initialValue: data.extensionofduration,
                        campo: CampoChangeOrder.extensionofduration,
                        label: 'Extensión de duración',
                        color: Colors.grey,
                        edit: editAllFields,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  if (data.extensionofduration != 'true') {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.doble,
                              isNumber: true,
                              flex: 3,
                              initialValue: data.durationoftheoriginalcontract,
                              campo: CampoChangeOrder
                                  .durationoftheoriginalcontract,
                              label: 'Duración del contrato original',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.doble,
                              isNumber: true,
                              flex: 3,
                              initialValue:
                                  data.durationofextensionsapprovedformerly,
                              campo: CampoChangeOrder
                                  .durationofextensionsapprovedformerly,
                              label:
                                  'Duración de las extensiones aprobadas anteriormente',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.doble,
                              isNumber: true,
                              flex: 3,
                              initialValue:
                                  data.durationofextensionunderapproval,
                              campo: CampoChangeOrder
                                  .durationofextensionunderapproval,
                              label: 'Duración de la extensión bajo aprobación',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.doble,
                              isNumber: true,
                              flex: 3,
                              initialValue: data.changeorderduration,
                              campo: CampoChangeOrder.changeorderduration,
                              label: 'Duración de la orden de cambio',
                              color: Colors.grey,
                              edit: false,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 5),
                const Divider(),
                Text(
                  'Justificación de la Orden de cambio',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 10),
                // Image.asset('images/category.png'),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.changeordercategory,
                        campo: CampoChangeOrder.changeordercategory,
                        label: 'Categoría de orden de cambio',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Category A",
                          "Category B",
                          "Category C",
                          "Category D",
                          "Category E",
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.changeorderlevel,
                        campo: CampoChangeOrder.changeorderlevel,
                        label: 'Nivel de orden de cambio',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Level I",
                          "Level II",
                          "Level III",
                          "Level IV",
                        ],
                      ),
                      const SizedBox(width: 10),
                      FieldPre(
                        tipoCampo: TipoCampo.desplegable,
                        flex: 3,
                        initialValue: data.finalauthorizer,
                        campo: CampoChangeOrder.finalauthorizer,
                        label: 'Autorizador final',
                        color: Colors.grey,
                        edit: editAllFields,
                        opciones: const [
                          "Head Local O&M",
                          "Head Global O&M Supply Chain",
                          "Head Global O&M",
                          "Head Global I&N",
                          "Head Local E&C",
                          "Head Local I&N",
                          "Head Global E&C Contract Management",
                          "Head Global E&C",
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FieldPre(
                  flex: null,
                  initialValue: data.reason,
                  campo: CampoChangeOrder.reason,
                  label: "Justificación",
                  color: Colors.grey,
                  edit: editAllFields,
                  tipoCampo: TipoCampo.textoLargo,
                ),

                // TextFormField(
                //   maxLines: null,
                //   decoration: InputDecoration(
                //     labelText: 'Justificación',
                //     border: OutlineInputBorder(),
                //   ),
                // ),

                // SizedBox(
                //   height: 40,
                //   child: Row(
                //     children: [
                //       // FieldPre(
                //       //   tipoCampo: TipoCampo.texto,
                //       //   flex: 3,
                //       //   initialValue: data.reason,
                //       //   campo: CampoChangeOrder.reason,
                //       //   label: 'Razón',
                //       //   color: Colors.grey,
                //       //   edit: editAllFields,
                //       // ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          viewSignaturesFields = !viewSignaturesFields;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                      iconSize: 16,
                      color: primaryColor,
                    ),
                    Text(
                      'Firmas',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  if (!viewSignaturesFields) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.unit1,
                              campo: CampoChangeOrder.unit1,
                              label: 'Unidad',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.namesurname1,
                              campo: CampoChangeOrder.namesurname1,
                              label: 'Nombre Apellido',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.unit2,
                              campo: CampoChangeOrder.unit2,
                              label: 'Unidad',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.namesurname2,
                              campo: CampoChangeOrder.namesurname2,
                              label: 'Nombre Apellido',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.unit3,
                              campo: CampoChangeOrder.unit3,
                              label: 'Unidad',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                            const SizedBox(width: 10),
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.namesurname3,
                              campo: CampoChangeOrder.namesurname3,
                              label: 'Nombre Apellido',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.unitglobalsccm,
                              campo: CampoChangeOrder.unitglobalsccm,
                              label:
                                  'Unidad Global Supply Chain(W&S o M&E o Log)/E&C-CM',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.headofsccm,
                              campo: CampoChangeOrder.headofsccm,
                              label:
                                  'Cabeza Global Supply Chain (W&S or M&E or Log)/E&C-CM',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.headofglobalsccm,
                              campo: CampoChangeOrder.headofglobalsccm,
                              label: 'Cabeza Global Supply Chain/E&C-CM',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.headofglobalomec,
                              campo: CampoChangeOrder.headofglobalomec,
                              label: 'Cabeza Global O&M/E&C',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.headofglobalin,
                              campo: CampoChangeOrder.headofglobalin,
                              label: 'Cabeza Global Infrastructure & Network',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          viewSignaturesGlobal = !viewSignaturesGlobal;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                      iconSize: 16,
                      color: primaryColor,
                    ),
                    Text(
                      'Firmas para contratos de funciones globales',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Builder(builder: (context) {
                  if (!viewSignaturesGlobal) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.headforelevantglobalfunctions,
                              campo: CampoChangeOrder
                                  .headforelevantglobalfunctions,
                              label: 'Jefe de funciones globales relevantes',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.globalunitglobalsccm,
                              campo: CampoChangeOrder.globalunitglobalsccm,
                              label:
                                  'Unidad global Supply Chain(W&S or M&E or Log)',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.globalheadofsccm,
                              campo: CampoChangeOrder.globalheadofsccm,
                              label: 'Cabeza Supply Chain (W&S or M&E or Log)',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.globalheadofglobalsccm,
                              campo: CampoChangeOrder.globalheadofglobalsccm,
                              label: 'Cabeza Global Supply Chain',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.globalheadofglobalomec,
                              campo: CampoChangeOrder.globalheadofglobalomec,
                              label: 'Cabeza Global O&M ',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            FieldPre(
                              tipoCampo: TipoCampo.texto,
                              flex: 3,
                              initialValue: data.globalheadofglobalin,
                              campo: CampoChangeOrder.globalheadofglobalin,
                              label: 'Cabeza Global Infrastructure & Network',
                              color: Colors.grey,
                              edit: editAllFields,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ]),
            ),
          );
        },
      ),
    );
  }
}
