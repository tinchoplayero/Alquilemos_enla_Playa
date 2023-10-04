//import 'package:alquilemos_enla_playa/disponibilidad/cubit/disponibilidad_cubit.dart';
//import 'package:alquilemos_enla_playa/feature/lista_huespedes/models/cubit/huesped_lista_cubit.dart';
//import 'package:alquilemos_enla_playa/formulario/cubit/formulario_cubit.dart';
//import 'package:alquilemos_enla_playa/widget/lista_huespedes.dart';

import 'package:alquilemos_enla_playa/pages/formulario/view/formulario.dart';

import '../../dispototal/view/vista_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dispo_por_depto/view/disponibilidad.dart';
import '../widget/widgets_home.dart';
import '/app/app.dart';
import 'package:go_router/go_router.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
//void main() => runApp(MainNavApp());

class MainNavApp extends StatelessWidget {
  static const name = 'pagina-inicio';
  const MainNavApp({super.key});
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    print('${user.email}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hola: ${user.email ?? "Desconocido"}"),
        actions: [
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                TituloGestion(),
              ],
            ),
            DiaHoraActual(),
            EventosDelDia(),
            
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.panorama_fish_eye),
        onPressed: () => context.pushNamed(VistaGeneral.name),
      ),*/
      floatingActionButton: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(
        heroTag: 'vista_general',
        child: Icon(Icons.view_agenda),
        onPressed: () => context.pushNamed(VistaGeneral.name),
      ),
      SizedBox(width: 16), // Espacio entre los botones flotantes
      FloatingActionButton(
        heroTag: 'disponibilidad',
        child: Icon(Icons.grid_view),
        onPressed: () => context.pushNamed(Disponibilidad.name),
      ),
      SizedBox(width: 16), // Espacio entre los botones flotantes
      FloatingActionButton(
        heroTag: 'formulario',
        child: Icon(Icons.person_add),
        onPressed: () => context.pushNamed(Formulario.name),
      ),
    ],
  ),
);
          
  }
}
