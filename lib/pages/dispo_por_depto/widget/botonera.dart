import '../cubit/disponibilidad_cubit.dart';
import 'calendario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme.dart';
import 'boton_depto.dart';


class Botonera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<DisponibilidadCubit, DisponibilidadState>(
      builder: (context, state) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotonDepto(
                  text: '2', 
                  press: () {context.read<DisponibilidadCubit>().botondoschanged();},
                  botonColor: state.botonDos ? customColor : primaryColor,
                  ),
                BotonDepto(
                  text: '4', 
                  press: () {context.read<DisponibilidadCubit>().botoncuatrochanged();},
                  botonColor: state.botonCuatro ? customColor : primaryColor,
                  ),
                BotonDepto(
                  text: '5', 
                  press: () {context.read<DisponibilidadCubit>().botoncincochanged();},
                  botonColor: state.botonCinco ? customColor : primaryColor,
                  ),
                 
                ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotonDepto(
                  text: '6', 
                  press: () {context.read<DisponibilidadCubit>().botonseischanged();},
                  botonColor: state.botonSeis ? customColor : primaryColor,
                  ),
                BotonDepto(
                  text: '7', 
                  press: () {context.read<DisponibilidadCubit>().botonsietechanged();},
                  botonColor: state.botonSiete ? customColor : primaryColor,
                  ),
                BotonDepto(
                  text: '8', 
                  press: () {context.read<DisponibilidadCubit>().botonochochanged();},
                  botonColor: state.botonOcho ? customColor : primaryColor,
                  ),
              ],
            ),
          ),
          Calendario()
        ]);
      },
    );
  }
}
