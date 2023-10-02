//import 'package:alquilemos_en_la_playa/disponibilidad.dart';
//import 'package:alquilemos_en_la_playa/home_page.dart';

import 'package:authentication_repository/authentication_repository.dart';

import '/app/bloc/app_bloc.dart';
import '/app/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home/view/main_nav.dart';
import '/routes/app_router.dart';
import 'firebase_options.dart';
import 'theme/theme.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationRepository>(
          create: (_) =>
              AuthenticationRepository(), // Puedes proporcionar aquí tu instancia de AuthenticationRepository.
        ),
      ],
      child: const MainApp(),
    ),
  );
/*MultiProvider(
      providers: [
        Provider<AppBloc>(
          create: (_) => AppBloc(authenticationRepository: authenticationRepository), // Puedes proporcionar aquí tu instancia de AuthenticationRepository.
        ),
              ],
      child: const MainApp(),
    );*/

  //runApp(const MainApp());
}

final authenticationRepository = AuthenticationRepository();
final appBloc = AppBloc(authenticationRepository: authenticationRepository);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final AppBloc appBloc = context.watch<AppBloc>();
    final _router = AppRouter(appBloc);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.router.routeInformationProvider,
      routeInformationParser: _router.router.routeInformationParser,
      routerDelegate: _router.router.routerDelegate,
      theme: temaAlquilemos,
    );
  }
}
