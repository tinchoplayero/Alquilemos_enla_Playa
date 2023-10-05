import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/huesped_cubit.dart';

class BotonGuardar extends StatelessWidget {
  final VoidCallback press;
  
  const BotonGuardar({
    Key? key,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String alias = '';
    double depto = 0.0;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ElevatedButton(
              child: Text('Guardar'),
              onPressed:  press,
                //context.read<HuespedListCubit>().addHuesped(alias, depto);
                //_openDialog(context);
              
                  

                ),
    );
  }
}
