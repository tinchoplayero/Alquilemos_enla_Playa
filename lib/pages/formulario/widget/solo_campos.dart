import 'package:alquilemos_enla_playa/pages/formulario/widget/boton_guardar.dart';
import 'package:flutter/material.dart';
import '../cubit/huesped_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoloCampos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String alias = '';
    double depto = 0.0;
    String fecha = '';
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Alias'),
            onChanged: (value) {
              alias = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Departamento'),
            onChanged: (value) {
              depto = double.parse(value);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Fecha de Ingreso'),
            onChanged: (value) {
              fecha = value;
            },
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              BotonGuardar(
                press: () {
                  context
                      .read<HuespedListCubit>()
                      .addHuesped(alias, depto, fecha);
                  print('Alias: ${alias} Depto: ${depto} Ingreso: ${fecha}');
                  _openDialog(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  _openDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Huesped Agregado'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
