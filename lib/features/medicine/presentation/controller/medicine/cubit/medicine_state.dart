part of 'medicine_cubit.dart';

enum MedicineStatus { empty, loading, success, failure }

class MedicineState extends Equatable {
  const MedicineState({
    this.status = MedicineStatus.empty,
    this.medicines = const <Medicine>[],
    this.currentWeekday = 0,
  });

  final List<Medicine> medicines;
  final int currentWeekday;
  final MedicineStatus status;

  MedicineState copyWith({
    List<Medicine>? medicines,
    MedicineStatus? status,
    int? currentWeekday,
  }) {
    return MedicineState(
      medicines: medicines ?? this.medicines,
      status: status ?? this.status,
      currentWeekday: currentWeekday ?? this.currentWeekday,
    );
  }

  @override
  List<Object> get props => [medicines, status, currentWeekday];
}
