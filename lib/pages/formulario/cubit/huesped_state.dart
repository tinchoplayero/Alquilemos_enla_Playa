part of 'huesped_cubit.dart';

class HuespedListState extends Equatable {
  final List<Huesped> huespedList;
  final bool loading;

  const HuespedListState({
    this.huespedList = const [],
    this.loading = false,
  });

  @override
  List<Object?> get props => [
        huespedList,
        loading,
      ];

  HuespedListState copyWith({
    List<Huesped>? huespedList,
    bool? loading,
  }) {
    return HuespedListState(
      huespedList: huespedList ?? this.huespedList,
      loading: loading ?? this.loading,
    );
  }
}

class FormularioState extends Equatable {
  final FormzSubmissionStatus status;
  final bool isValid;
  final TextoInput alias;
  final NumeroInput telefono;
  final TextoInput nombre;
  final TextoInput apellido;
  final EmailInput email;
  final String deptoSeleccionado;

  FormularioState({
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.alias = const TextoInput.pure(),
    this.telefono = const NumeroInput.pure(),
    this.nombre = const TextoInput.pure(),
    this.apellido = const TextoInput.pure(),
    this.email = const EmailInput.pure(),
    this.deptoSeleccionado = '0',
  });

  @override
  List<Object> get props => [alias, isValid, telefono, nombre, apellido, email, status,deptoSeleccionado];

  FormularioState copyWith({
    FormzSubmissionStatus? status,
    bool? isValid,
    TextoInput? alias,
    NumeroInput? telefono,
    TextoInput? nombre,
    TextoInput? apellido,
    EmailInput? email,
    String? deptoSeleccionado,

  }){
    return FormularioState(
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      alias: alias ?? this.alias,
      telefono: telefono ?? this.telefono,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      email: email ?? this.email,
      deptoSeleccionado: deptoSeleccionado ?? this.deptoSeleccionado,

    );
  
  }

}


 
