import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../bloc/main_bloc.dart';
import '../changeorder/view/changeorder_page.dart';
import '../changeorder/view/changeorderlist_page.dart';
import '../gm/view/gm_page.dart';
import '../resources/transicion_pagina.dart';
import 'package:url_launcher/url_launcher.dart';

import '../version.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double elevationCard1 = 1.0;
  double elevationCard2 = 1.0;
  double elevationCard3 = 1.0;
  double elevationCard4 = 1.0;
  double elevationCard5 = 1.0;
  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    // Color primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    // Color onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    // Color tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;
    // Color onTertiaryContainer =
    //     Theme.of(context).colorScheme.onTertiaryContainer;
    // Color secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    // Color onSecondaryContainer =
    //     Theme.of(context).colorScheme.onSecondaryContainer;
    // Color background = Theme.of(context).colorScheme.background;
    // Color onBackground = Theme.of(context).colorScheme.onBackground;
    Color primary = Theme.of(context).colorScheme.primary;
    Color tertiary = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Chan",
                style: TextStyle(color: tertiary, fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: "GE",
                style: TextStyle(color: primary, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
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
        actions: [
          ElevatedButton(
            onPressed: () {
              launchUrl(
                Uri.parse(
                  'https://enelcom.sharepoint.com/sites/ProjectManagementConstructionColombia/cm/SitePages/ChanGO.aspx',
                ),
              );
            },
            child: const Text('Ayuda'),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Recargar datos',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(Load());
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Cambiar color',
            child: IconButton(
              onPressed: () {
                showDialog(
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Escoge un color'),
                      content: SingleChildScrollView(
                        child: MaterialColorPicker(
                          allowShades: false,
                          onMainColorChange: (value) {
                            if (value != null) {
                              BlocProvider.of<MainBloc>(context).add(
                                ThemeColorChange(color: Color(value.value)),
                              );
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    );
                  },
                  context: context,
                );
              },
              icon: const Icon(Icons.color_lens),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cambiar tema',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(ThemeChange());
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cerrar sesión',
            child: IconButton(
              icon: Icon(Icons.logout, color: primary, size: 16),
              onPressed: () async => await FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Version.data, style: Theme.of(context).textTheme.labelSmall),
            Text(
              Version.status('Home', '$runtimeType'),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
      body: SingleChildScrollView(
        child: Listeners(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if (state.user == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<String> permisos = state.user!.permisos;
                return Column(
                  children: [
                    // Text(
                    //   'Sección 1',
                    //   style: Theme.of(context).textTheme.titleMedium,
                    // ),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                      children: [
                        SimpleCard(
                          page: const ChangeOrderListPage(),
                          title: 'Órdenes',
                          image: 'images/books.png',
                          enabled: state.changeOrderList != null,
                          message:
                              'Se podrán ver y editar las ordenes de cambio creadas en el aplicativo.',
                        ),
                        SimpleCard(
                          page: const ChangeOrderPage(esNuevo: true),
                          title: 'Crear Orden',
                          image: 'images/new.png',
                          enabled:
                              state.changeOrder != null &&
                              state.eurcop != null &&
                              state.usdcop != null &&
                              state.gm != null &&
                              permisos.contains('crear_orden'),
                          message: 'Se podrá crear una nueva orden de cambio.',
                        ),
                        SimpleCard(
                          page: const GmListPage(),
                          title: 'Grupos Mercológicos',
                          image: 'images/activities.png',
                          enabled: state.gm != null,
                          message:
                              'Se podrán explorar los diferentes grupos mercológicos.',
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Listeners extends StatelessWidget {
  final Widget child;
  const Listeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listenWhen:
          (previous, current) => previous.errorCounter != current.errorCounter,
      listener: (context, state) {
        // ignore: avoid_print
        print(state.message);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 8),
            backgroundColor: state.messageColor,
            content: Text(state.message),
          ),
        );
      },
      child: BlocListener<MainBloc, MainState>(
        listenWhen:
            (previous, current) =>
                previous.dialogCounter != current.dialogCounter,
        listener: (context, state) {
          // ignore: avoid_print
          print(state.dialogMessage);
          if (state.dialogMessage.isNotEmpty) {
            showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('Atención'),
                  content: Text(state.dialogMessage),
                  actions: [
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }),
            );
          }
        },
        child: child,
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  final dynamic page;
  final String title;
  final String image;
  final Function? fun;
  final Color? color;
  final bool enabled;
  final String message;

  const SimpleCard({
    required this.page,
    required this.title,
    required this.image,
    required this.enabled,
    required this.message,
    this.color,
    this.fun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return Tooltip(
      message: message,
      child: Opacity(
        opacity: enabled ? 1 : 0.1,
        child: SizedBox(
          width: 148.0,
          child: Card(
            color: color,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                if (page is Widget) {
                  try {
                    goTo(page);
                  } finally {
                    if (fun != null) fun!();
                  }
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(image, width: 50, height: 50),
                    Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
