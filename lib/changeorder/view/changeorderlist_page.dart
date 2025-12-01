import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/transicion_pagina.dart';
import '../model/changeorder_model.dart';
import 'changeorder_page.dart';

class ChangeOrderListPage extends StatefulWidget {
  const ChangeOrderListPage({Key? key}) : super(key: key);

  @override
  State<ChangeOrderListPage> createState() => _ChangeOrderListPageState();
}

class _ChangeOrderListPageState extends State<ChangeOrderListPage> {
  final uSFormat = NumberFormat.currency(
    locale: "en_US",
    symbol: "\$",
    decimalDigits: 0,
  );

  bool isLoading = true;
  final ScrollController _controller = ScrollController();
  int view = 60;
  @override
  void initState() {
    Timer(const Duration(milliseconds: 800), () {
      setState(() => isLoading = false);
    });

    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() => view += 40);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHANGE ORDER LIST'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocSelector<MainBloc, MainState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              // print('called');
              return state ? const LinearProgressIndicator() : const SizedBox();
            },
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          List? data = state.changeOrderList?.lista;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return FloatingActionButton(
            onPressed: () => DescargaHojas().ahora(
              datos: data,
              nombre: 'ChangeOrderList',
            ),
            child: const Icon(Icons.download),
          );
        },
      ),
      body:
          isLoading ? const Center(child: CircularProgressIndicator()) : body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            searchField(),
            const SizedBox(height: 10),
            titleRow(),
            futureMng(),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            labelText: 'Búsqueda',
          ),
          onChanged: (value) {
            context.read<MainBloc>().add(
                  BusquedaChangeOrderList(
                    busqueda: value,
                  ),
                );
          },
        ),
      ),
    );
  }

  Widget titleRow() {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        var listaTitulo = state.changeOrderList?.listaTitulo ?? [];
        // print(listaTitulo);
        return Row(
          children: [
            for (var titulo in listaTitulo)
              Expanded(
                flex: titulo['flex'],
                child: Text(
                  titulo['texto'].toString().toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget futureMng() {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        List<ChangeOrder> lista = state.changeOrderList?.listaSearch ?? [];
        int endList = view > lista.length ? lista.length : view;
        return tableData(
          datos: lista.sublist(0, endList),
          itemsAndFlex: state.changeOrderList?.itemsAndFlex ?? {},
          keys: state.changeOrderList?.keys ?? [],
        );
      },
    );
  }

  Widget tableData({
    required List<ChangeOrder> datos,
    required Map itemsAndFlex,
    required List keys,
  }) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return ListView.builder(
      shrinkWrap: true,
      itemCount: datos.length,
      itemBuilder: (context, index) {
        Map datoSing = datos[index].toMap();
        List listaDato = [
          for (var key in keys)
            {
              'texto': datoSing[key],
              'flex': itemsAndFlex[key][0],
              'index': key
            },
        ];
        return InkWell(
          onLongPress: () {
            context.read<MainBloc>().add(
                  SetChangeOrder(
                    changeOrder: datos[index],
                  ),
                );
            goTo(const ChangeOrderPage(esNuevo: false));
          },
          onDoubleTap: () {
            context.read<MainBloc>().add(
                  SetChangeOrder(
                    changeOrder: datos[index],
                  ),
                );
            goTo(const ChangeOrderPage(esNuevo: false));
          },
          onTap: () {
            context.read<MainBloc>().add(
                  SetChangeOrder(
                    changeOrder: datos[index],
                  ),
                );
            goTo(const ChangeOrderPage(esNuevo: false));
          },
          child: Row(
            children: [
              for (var dato in listaDato)
                Expanded(
                  flex: dato['flex'],
                  child: SelectableText(
                    dato['texto'],
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
