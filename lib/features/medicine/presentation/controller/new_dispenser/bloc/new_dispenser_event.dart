part of 'new_dispenser_bloc.dart';

abstract class AddPatientEvent extends Equatable {
  const AddPatientEvent();

  @override
  List<Object> get props => [];
}

// class PatientDataAdded extends AddPatientEvent {
//   const PatientDataAdded({
//     required this.dispenser,
//     required this.patientId,
//   });
//   final DispenserModel dispenser;
//   final String patientId;

//   @override
//   List<Object> get props => [patientId, dispenser];
// }

class DispenserAdded extends AddPatientEvent {
  const DispenserAdded({
    required this.dispenser,
  });
  final Dispenser dispenser;

  @override
  List<Object> get props => [dispenser];
}

class DispenserDeleted extends AddPatientEvent {
  const DispenserDeleted({
    required this.dispenserId,
    required this.index,
  });
  final String dispenserId;
  final String index;

  @override
  List<Object> get props => [dispenserId, index];
}
