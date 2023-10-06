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
import 'package:shared_preferences/shared_preferences.dart';

class MainNavApp extends StatefulWidget {
  static const name = 'pagina-inicio';
  const MainNavApp({Key? key}) : super(key: key);

  @override
  _MainNavAppState createState() => _MainNavAppState();
}

class _MainNavAppState extends State<MainNavApp> {
  @override
  void initState() {
    super.initState();
    inicioPrimeraVez(); // Pasa el contexto como argumento
  }


  Future inicioPrimeraVez() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //final user = context.select((AppBloc bloc) => bloc.state.user);
    //final userId = user != null ? user.id : null; // Asumo que tienes una propiedad 'id' en tu objeto de usuario
    //final key = 'primeraVez_$userId'; // Usamos una clave única para cada usuario
    //bool _primeraVez = (prefs.getBool(key) ?? false);
    
    bool _primeraVez = (prefs.getBool('primeraVez') ?? false);

    //print("Usuario: $userId Valor: $_primeraVez");
    if (!_primeraVez) {
      await prefs.setBool('primeraVez', true);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bienvenido!'),
             
            content: Text('Este es tu primer inicio de sesión'),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

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
            ElevatedButton( // BOTON PARA ELIMINAR LAS PREFERENCIAS DE USUARIO
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear(); 
              },
              child: Text('Borrar prefs'),
            )
          ],
        ),
      ),
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
