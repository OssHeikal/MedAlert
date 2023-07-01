part of 'new_dispenser_bloc.dart';

class NewDispenserState extends Equatable {
  const NewDispenserState({
    this.status = RequestStatus.initial,
    this.message = '',
  });

  final RequestStatus status;
  final String message;

  NewDispenserState copyWith({
    RequestStatus? status,
    String? message,
  }) {
    return NewDispenserState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
