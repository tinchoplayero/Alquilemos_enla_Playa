import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../services/database/database_repository_impl.dart';
import 'package:meta/meta.dart';

import '../models/huesped.dart';

part 'huesped_list_state.dart';

class HuespedListCubit extends Cubit<HuespedListState> {
  HuespedListCubit(this._databaseRepository) : super(HuespedListState());

  final DatabaseRepository _databaseRepository;

  Future<void> addHuesped(String alias, double depto) async {
    emit(state.copyWith(loading: true));

    await _databaseRepository.addHuesped(alias, depto);

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
