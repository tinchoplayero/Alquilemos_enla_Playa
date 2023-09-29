//import 'package:alquilemos_enla_playa/nuevo_huesped.dart';
//import 'package:alquilemos_enla_playa/vista_general.dart';
//import 'package:alquilemos_enla_playa/disponibilidad.dart';
//import 'package:alquilemos_enla_playa/home_page.dart';
//import 'package:alquilemos_enla_playa/main.dart';
import '../login/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/bloc/app_bloc.dart';
import '../home/view/main_nav.dart';

class AppRouter {
  final AppBloc appBloc;
  final GoRouter _router;

  AppRouter(AppBloc this.appBloc)
      : _router = GoRouter(
          navigatorKey: GlobalKey<NavigatorState>(),
          initialLocation: "/pagina-inicio",
          routes: [
            GoRoute(
              name: MainNavApp.name,
              path: "/pagina-inicio",
              builder: (context, state) => MainNavApp(),
              redirect: (context, state) {
                print('Estado de la Auth ${appBloc.state.status.toString()}');
                if (appBloc.state.status == AppStatus.unauthenticated){
                  return "/login";
                }
                return "/pagina-inicio";
              },
            ),
            GoRoute(
              name: LoginPage.name,
              path: "/login",
              builder: (context, state) => LoginPage(),
            ),
            //GoRoute(
            //  name: SignUpPage.name,
            //  path: "/signUp",
            //  builder: (context, state) => SignUpPage(),
            //),
            /*GoRoute(
          name: Disponibilidad.name,
          path: "/pagina-disponibilidad",
          builder: (context, state) => Disponibilidad(),
        ),
        GoRoute(
          name: VistaGeneral.name,
          path: "/vista-genral",
          builder: (context, state) => VistaGeneral(),
        ),
        GoRoute(
          name: NuevoHuesped.name,
          path: "/nuevo-huesped",
          builder: (context, state) => NuevoHuesped(),
        ),*/
          ],
        );

  // Error A function body must be provided
  GoRouter get router {
    return _router;
  }
}
