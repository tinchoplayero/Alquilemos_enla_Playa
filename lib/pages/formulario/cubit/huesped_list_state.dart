part of 'huesped_list_cubit.dart';

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
