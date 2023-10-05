import '../cubit/huesped_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormularioCubit, FormularioState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            print('Valor recibido en email: ${value}');
            context.read<FormularioCubit>().emailCambio(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'email',
            errorText:
               state.email.isNotValid ? 'No tiene el formato o está vacio' : null,
          ),
        );
      },
    );
  }
}
/*
decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Apellido',
          ),

*/