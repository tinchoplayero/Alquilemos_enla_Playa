import 'package:alquilemos_enla_playa/pages/formulario/widget/fomularioz.dart';

import '../../../services/database/database_repository_impl.dart';
import '../widget/solo_campos.dart';
import 'package:flutter/material.dart';
import '../cubit/huesped_cubit.dart';
import '/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/database/database_service.dart';


class Formulario extends StatelessWidget {
  static const name = 'formulario';
  const Formulario({super.key});

    @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final databaseRepository = DatabaseRepositoryImpl(); // Crea una instancia de DatabaseRepositoryImpl
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("${user.email ?? "Desconocido"} Ingresá un Huesped"),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => HuespedListCubit(databaseRepository),
          child: SoloCampos(),
        ),
        BlocProvider(
            create: (context) => FormularioCubit(),
          child: FormularioFormz(),
        ),
        ],
      ),
            
          );
          
      
    
  }
}



/*Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Ingrese el alias'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Guardar'))
          ],
        ),
      )*/