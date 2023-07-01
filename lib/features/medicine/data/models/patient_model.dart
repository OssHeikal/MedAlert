import 'package:smart_pill/features/medicine/data/models/dispenser_model.dart';
import 'package:smart_pill/features/medicine/domain/entities/patient.dart';

// class PatientModel extends Patient {
//   const PatientModel({
//     required String id,
//     required List<DispenserModel> dispensers,
//   }) : super(
//           id: id,
//           dispensers: dispensers,
//         );

//   factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
//         id: json["id"],
//         dispensers: List<DispenserModel>.from(
//             (json["dispensers"] as List).map((x) => PatientModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "dispensers": List<dynamic>.from(dispensers.map((x) => x.toJson())),
//       };
// }

class PatientModel extends Patient {
  const PatientModel({
    required String id,
    required List<DispenserModel> dispensers,
  }) : super(
          id: id,
          dispensers: dispensers,
        );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dispenserList = json['dispensers'];

    return PatientModel(
      id: json['id'],
      dispensers: dispenserList
          .map((dispenserJson) => DispenserModel.fromJson(dispenserJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dispensers': dispensers.map((dispenser) => dispenser.toJson()).toList(),
    };
  }
}
