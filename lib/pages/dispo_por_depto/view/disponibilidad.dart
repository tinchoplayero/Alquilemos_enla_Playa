import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../formulario/view/formulario.dart';
import '../cubit/disponibilidad_cubit.dart';
import '../widget/botonera.dart';
import '/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Disponibilidad extends StatelessWidget {
  static const name = 'pagina-disponibilidad';
  const Disponibilidad({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dispo por Depto ${user.email ?? "Desconocido"}"),
      ),
      body: Container(
          child: BlocProvider(
        create: (context) => DisponibilidadCubit(),
        child: Botonera(),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
