import 'package:flutter/material.dart';
import '../cubit/huesped_list_cubit.dart';
import '/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/database/database_service.dart';


class SoloCampos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String alias = '';
    double depto = 0.0;
    return Column(
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
              Row(
                children: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      
                    },
                  ),
                  ElevatedButton(
                    child: Text('Guardar'),
                    onPressed: () {
                      print('Alias: ${alias} Depto: ${depto}');
                      context.read<HuespedListCubit>().addHuesped(alias, depto);
                      
                    },
                  ),
                ],
              ),
              ],
            );


    }
    }