import 'package:flutter/material.dart';
import '../cubit/huesped_cubit.dart';
import '/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/database/database_service.dart';
import '../forms_input/forms_input.dart';
import '../models/models_formz.dart';

class FormularioFormz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Column(
      children: [
        SizedBox(height: 16.0),
        CampoAlias(),
        SizedBox(height: 16.0),
        CampoNombre()
      ],
    );
  }
}
