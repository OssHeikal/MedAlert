import 'package:equatable/equatable.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';

class Patient extends Equatable {
  const Patient({
    required this.id,
    required this.dispensers,
    // required this.medicines,
  });

  final String id;
  final List<Dispenser> dispensers;
  // final List<Medicine> medicines;

  const Patient.empty()
      : id = '',
        dispensers = const [];
  // medicines = const [];

  @override
  List<Object?> get props => [dispensers];
}
