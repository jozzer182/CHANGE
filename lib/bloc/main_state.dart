part of 'main_bloc.dart';

class MainState {
  int dialogCounter;
  String dialogMessage;
  String message;
  int messageCounter;
  int errorCounter;
  Color messageColor;
  bool isLoading;
  bool isDark = false;
  Color? themeColor;
  User? user;
  Users? users;
  Perfiles? perfiles;
  ChangeOrderList? changeOrderList;
  ChangeOrder? changeOrder;
  Gm? gm;
  Eurcop? eurcop;
  Usdcop? usdcop;


  MainState({
    this.dialogCounter = 0,
    this.dialogMessage = '',
    this.message = '',
    this.messageCounter = 0,
    this.errorCounter = 0,
    this.messageColor = Colors.red,
    this.isLoading = false,
    this.isDark = false,
    this.themeColor,
    this.user,
    this.users,
    this.perfiles,
    this.changeOrderList,
    this.changeOrder,
    this.gm,
    this.eurcop,
    this.usdcop,
  });

  initial() {
    dialogCounter = 0;
    dialogMessage = '';
    message = '';
    messageCounter = 0;
    errorCounter = 0;
    messageColor = Colors.red;
    isLoading = false;
    isDark = false;
    themeColor = null;
    user = null;
    users = null;
    perfiles = null;
    changeOrderList = null;
    changeOrder = null;
    gm = null;
    eurcop = null;
    usdcop = null;
  }

  MainState copyWith({
    int? dialogCounter,
    String? dialogMessage,
    String? message,
    int? messageCounter,
    int? errorCounter,
    Color? messageColor,
    bool? isLoading,
    bool? isDark,
    Color? themeColor,
    User? user,
    Users? users,
    Perfiles? perfiles,
    ChangeOrderList? changeOrderList,
    ChangeOrder? changeOrder,
    Gm? gm,
    Eurcop? eurcop,
    Usdcop? usdcop,
  }) {
    return MainState(
      dialogCounter: dialogCounter ?? this.dialogCounter,
      dialogMessage: dialogMessage ?? this.dialogMessage,
      message: message ?? this.message,
      messageCounter: messageCounter ?? this.messageCounter,
      errorCounter: errorCounter ?? this.errorCounter,
      messageColor: messageColor ?? this.messageColor,
      isLoading: isLoading ?? this.isLoading,
      isDark: isDark ?? this.isDark,
      themeColor: themeColor ?? this.themeColor,
      user: user ?? this.user,
      users: users ?? this.users,
      perfiles: perfiles ?? this.perfiles,
      changeOrderList: changeOrderList ?? this.changeOrderList,
      changeOrder: changeOrder ?? this.changeOrder,
      gm: gm ?? this.gm,
      eurcop: eurcop ?? this.eurcop,
      usdcop: usdcop ?? this.usdcop,
    );
  }
}
