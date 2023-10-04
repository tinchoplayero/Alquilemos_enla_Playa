//import 'package:alquilemos_enla_playa/nuevo_huesped.dart';
//import 'package:alquilemos_enla_playa/vista_general.dart';
//import 'package:alquilemos_enla_playa/disponibilidad.dart';
//import 'package:alquilemos_enla_playa/home_page.dart';
//import 'package:alquilemos_enla_playa/main.dart';
import '../login/login.dart';
import '../sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/bloc/app_bloc.dart';
import '../pages/home/view/main_nav.dart';
import '../pages/dispototal/view/vista_general.dart';
import '../pages/dispo_por_depto/view/disponibilidad.dart';
import '../pages/formulario/view/formulario.dart';

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
                if (appBloc.state.status == AppStatus.unauthenticated) {
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
            GoRoute(
              name: SignUpPage.name,
              path: "/signUp",
              builder: (context, state) => SignUpPage(),
            ),
            GoRoute(
              name: VistaGeneral.name,
              path: "/vista-genral",
              builder: (context, state) => VistaGeneral(),
            ),
            GoRoute(
              name: Disponibilidad.name,
              path: "/pagina-disponibilidad",
              builder: (context, state) => Disponibilidad(),
            ),
            GoRoute(
              name: Formulario.name,
              path: "/formulario",
              builder: (context, state) => Formulario(),
            ),
          ],
        );

  // Error A function body must be provided
  GoRouter get router {
    return _router;
  }
}
