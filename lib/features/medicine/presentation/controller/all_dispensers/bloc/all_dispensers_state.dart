part of 'all_dispensers_bloc.dart';

class AllDispensersState extends Equatable {
  const AllDispensersState({
    this.status = RequestStatus.initial,
    this.message = '',
    this.dispensers = const [],
    // this.patient = const Patient.empty(),
  });
  final RequestStatus status;
  final String message;
  // final Patient patient;
  final List<Dispenser> dispensers;

  AllDispensersState copyWith({
    RequestStatus? status,
    String? message,
    // Patient? patient,
    List<Dispenser>? dispensers,
  }) {
    return AllDispensersState(
      status: status ?? this.status,
      message: message ?? this.message,
      dispensers: dispensers ?? this.dispensers,
      // patient: patient ?? this.patient,
    );
  }

  @override
  List<Object> get props => [status, message, dispensers];
}
