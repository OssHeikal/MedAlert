import 'package:timezone/timezone.dart' as tz;

class IdGenerator {
  static String generateMedicineId(String patientId, int index) {
    return 'DIS-$index-$patientId';
  }

  static int generateNotificationId(int id, tz.TZDateTime date) {
    return int.parse('$id${date.day}${date.hour}');
  }
}
