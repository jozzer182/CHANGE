part of '../../bloc/main_bloc.dart';

class ChangeOrderField extends MainEvent {
  final String valor;
  final CampoChangeOrder campo;
  final String tabla;
  final int index;
  ChangeOrderField({
    required this.valor,
    required this.campo,
    required this.tabla,
    required this.index,
  });
}

class BusquedaChangeOrderList extends MainEvent {
  final String busqueda;
  BusquedaChangeOrderList({
    required this.busqueda,
  });
}

class SetChangeOrder extends MainEvent {
  final ChangeOrder changeOrder;
  SetChangeOrder({
    required this.changeOrder,
  });
}

class AddToDbChangeOrder extends MainEvent {
  final BuildContext context;
  AddToDbChangeOrder(
    this.context,
  );
}

class UpdateToDbChangeOrder extends MainEvent {
  final BuildContext context;
  UpdateToDbChangeOrder(
    this.context,
  );
}


class ValidateChangeOrder extends MainEvent {
  ValidateChangeOrder();
}