part of 'all_dispensers_bloc.dart';

abstract class AllDispensersEvent extends Equatable {
  const AllDispensersEvent();

  @override
  List<Object> get props => [];
}

class AllDispensersFetched extends AllDispensersEvent {
  const AllDispensersFetched({required this.dispensers});
  final List<Dispenser> dispensers;

  @override
  List<Object> get props => [dispensers];
}
