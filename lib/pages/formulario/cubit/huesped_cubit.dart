import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

import '../../../services/database/database_repository_impl.dart';
import '../forms_input/forms_input.dart';
import '../models/huesped.dart';
part 'huesped_state.dart';

class HuespedListCubit extends Cubit<HuespedListState> {
  HuespedListCubit(this._databaseRepository) : super(HuespedListState());

  final DatabaseRepository _databaseRepository;

  Future<void> addHuesped(String alias, double depto, String fecha) async {
    emit(state.copyWith(loading: true));

    await _databaseRepository.addHuesped(alias, depto, fecha);

    emit(state.copyWith(loading: false));
  }

  void getHuespedes() async {
    emit(state.copyWith(loading: true));

    // List<Huesped> huespedList = await _databaseRepository.getHuespedes();
    Stream<List<Huesped>> huespedListStream =
        _databaseRepository.getHuespedesStream();

    huespedListStream.listen(
      (event) {
        emit(
          state.copyWith(
            loading: false,
            huespedList: event,
          ),
        );
      },
    );
  }

  void saveDummyData() async {
    emit(state.copyWith(loading: true));

    await _databaseRepository.saveDummyData();

    emit(state.copyWith(loading: false));
  }
}

class FormularioCubit extends Cubit<FormularioState> {
  FormularioCubit() : super(FormularioState());

  void cambiarNumero(String deptoElegido) {
    emit(state.copyWith(
      deptoSeleccionado: deptoElegido,
    )); 
  }

  void emailCambio(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
        
      ]),
    ));
  }

  
  void aliasChanged(String value) {
    final texto = TextoInput.dirty();
    emit(state.copyWith(
      alias: texto,
      isValid: Formz.validate([
        texto,
        ]),
    ));
  }

  void nombreChanged(String value) {
    final texto = TextoInput.dirty();
    emit(state.copyWith(
      nombre: texto,
      isValid: Formz.validate([
        texto,
        ]),
    ));
  }
 
  void apellidoChanged(String value) {
    final texto = TextoInput.dirty();
    emit(state.copyWith(
      apellido: texto,
      isValid: Formz.validate([
        texto,
        ]),
    ));
  }

  void telefonoChanged(String value) {
    final numero = NumeroInput.dirty();
    emit(state.copyWith(
      telefono: numero,
      isValid: Formz.validate([
        numero,
        ]),
    ));
  }

  
}

