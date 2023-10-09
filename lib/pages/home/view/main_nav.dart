import '../../formulario/view/formulario.dart';
import '../../dispototal/view/vista_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dispo_por_depto/view/disponibilidad.dart';
import '../widget/widgets_home.dart';
import '/app/app.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/user_prefs.dart';

class MainNavApp extends StatefulWidget {
  static const name = 'pagina-inicio';
  const MainNavApp({Key? key}) : super(key: key);

  @override
  _MainNavAppState createState() => _MainNavAppState();
}

class _MainNavAppState extends State<MainNavApp> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    print('${user.id}');

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      bool _primeraVez = UserPreferences().getPrimeraVez(user.id);

      if (!_primeraVez) {
        UserPreferences().setPrimeraVez(user.id, true);
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
    });
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'vista_general',
            child: Icon(Icons.view_agenda),
            onPressed: () => context.pushNamed(VistaGeneral.name),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'disponibilidad',
            child: Icon(Icons.grid_view),
            onPressed: () => context.pushNamed(Disponibilidad.name),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'formulario',
            child: Icon(Icons.person_add),
            onPressed: () => context.pushNamed(Formulario.name),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
              },
            ),
            Text('Borrar Prefs'),
          ],
        ),
      ),
    );
  }
}
